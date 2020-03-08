<template lang='pug'>
  form.p-search-places
    input.p-search-places__input(placeholder='検索')
</template>

<script>
export default {
};
</script>

<style lang='scss' scoped>
.p-search-places {
  &__input {
    width: 180px;
    height: 24px;
    padding: 0 15px;
    font-size: 14px;
    color: #111;
    background-color: #fff;
    border-radius: 24px;

    &::placeholder {
      color: #999;
    }
  }
}
</style>
