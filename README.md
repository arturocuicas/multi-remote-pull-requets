# multi-remote-pull-requets

This Github Action copy a folder from the currente repository to a location in a list of repositories and create a Pull Request

This Action is a modified version of:

[paygoc6/action-pull-request-another-repo](https://github.com/paygoc6/action-pull-request-another-repo).

[MDRCNY/MDRCNY-Actions-CPR](https://github.com/MDRCNY/MDRCNY-Actions-CPR/tree/main)

## Example Workflow

``` yaml
    - name: Multi Remote Pull Requests for Another Repositories
      uses: arturocuicas/multi-remote-pull-requets@v0.0.1
      env:
        API_TOKEN_GITHUB: ${{ env.GITHUB_TOKEN }}
      with:
        source_folder: 'protos/pb'
        destination_repos: '.github/repositories.yaml'
        destination_folder: 'pb'
        destination_base_branch: 'main'
        destination_head_branch: 'update_users_proto'
        user_email: 'it@mattilda.io'
        user_name: 'Matti Bot'
        pull_request_reviewers: 'arturocuicas'
        title: 'Update pb users'
        body: 'This is an automated pull request to update the pb users'
```

`repositories.yaml`

```yaml
repositories:
    source_name/grpc-service1
    source_name/grpc-service2
```

## Variables

- source_folder: The folder to be moved. Uses the same syntax as the cp command. Incude the path for any files not in the repositories root directory.
- destination_repos: The path of a .yaml file with the repositories key and the list of repositories.
- destination_folder: [optional] The folder in the destination repository to place the file in, if not the root directory.
- user_email: The GitHub user email associated with the API token secret.
- user_name: The GitHub username associated with the API token secret.
- destination_base_branch: [optional] The branch into which you want your code merged. Default is main.
- destination_head_branch: The branch to create to push the changes. Cannot be master or main.
- pull_request_reviewers: [optional] The pull request reviewers. It can be only one (just like 'reviewer') or many (just like 'reviewer1,reviewer2,...')
- title: [optional] The pull request title.
- body: [optional] The pull request body.

## Secrets

- API_TOKEN_GITHUB: You must create a personal access token in you account. Follow the link:
- Personal access token.

> You must select the scopes: 'repo = Full control of private repositories', 'admin:org = read:org' and 'write:discussion = Read:discussion';

## Behavior Notes

The action will create any destination paths if they don't exist. It will also overwrite existing files if they already exist in the locations being copied to. It will not delete the entire destination repository.