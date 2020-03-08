<template lang='pug'>
  form.p-selectable-places__search
    input.p-selectable-places__search-input(placeholder='検索')
</template>

<script>
export default {
};
</script>

<style lang='scss' scoped>
.p-selectable-places {
  &__search-input {
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
