Return-Path: <linux-leds+bounces-5734-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4770BBD00FB
	for <lists+linux-leds@lfdr.de>; Sun, 12 Oct 2025 12:41:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C61B18923E0
	for <lists+linux-leds@lfdr.de>; Sun, 12 Oct 2025 10:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E470271469;
	Sun, 12 Oct 2025 10:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZI+gZSyt"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0D61E260D;
	Sun, 12 Oct 2025 10:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760265664; cv=none; b=Zzfy61x4xOBOLwkIE+sPncpiGnBw4R7HCwy62JqV1xBRc4JVrN/x6tMBhqUmNn4eK6Fa/3/oUyjDXYs7AoDk57PZrL04YXcgZIjK0rn47qo5NQq6SErhIM6D3bubLoORIXuQRPXijgvKPEjIBbW8vFEgw3JvAXM3OkqoK+KYDLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760265664; c=relaxed/simple;
	bh=6XZ2TepMGYVcVHdXOwYD9BHbnutdWTq3FqUNdlx3Khg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=STTPsvoICKtawhW/DQs3qcZG68iWpsXFh3BYTlQgt0rjaFl7Zg835kkwNXzCk3faGKeZdkyzai8ccu7Vfv7SgZw7rB2pTRkYPThSwTyt6glXrDuDDZ6OCCqWPiwuG2CX0KMYwIFTZP3jL70yiEu9dfI8zicZQvnreT4X0dcHWAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZI+gZSyt; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760265661; x=1791801661;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6XZ2TepMGYVcVHdXOwYD9BHbnutdWTq3FqUNdlx3Khg=;
  b=ZI+gZSytVzh3GpodcMWuprjz6CM9yGbQF8E5rViFdxBhRHUapanIDs/X
   1djWyBdRAOdo45p6u9bbbGKlKlq0pqTgAAOmipKyHLMrprdwR4SdS+QGi
   ViqcKR8RlKzWQbtfIGPqDgYYfLXEymIPt0YFQuQ8AQMkKhMUv+HcVw2z2
   MUz/DV7e2w6LpnuBCBZcK/v0SVJXH/tnyL0mYTa1a5wrFJVyqv14oHCSO
   v2G5ifjoaDwTNo97oa3xV3uSCGln8kimHAPlfqVGe9wo9BK0QEqXE0zYJ
   1hZouxXRf4D4H+2Yayp1UGc4JkguzfOqGxukeufXswAnCqmtRfgaDpXwn
   A==;
X-CSE-ConnectionGUID: 32Y+OeTSS8Gr1ZkGtfNhPw==
X-CSE-MsgGUID: dd0m7/GDTIiXLlFJpsO2Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="61457193"
X-IronPort-AV: E=Sophos;i="6.19,223,1754982000"; 
   d="scan'208";a="61457193"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2025 03:41:00 -0700
X-CSE-ConnectionGUID: vwmq1nJRQi+Ue/vAP1l63A==
X-CSE-MsgGUID: a+9iheqfT/uCpHMSjG3ShA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,223,1754982000"; 
   d="scan'208";a="212318719"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Oct 2025 03:40:55 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7tVV-0004Kd-1V;
	Sun, 12 Oct 2025 10:40:53 +0000
Date: Sun, 12 Oct 2025 18:40:52 +0800
From: kernel test robot <lkp@intel.com>
To: Markus Probst <markus.probst@posteo.de>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Markus Probst <markus.probst@posteo.de>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 2/2] rust: leds: add basic led classdev abstractions
Message-ID: <202510121801.TbAguq2S-lkp@intel.com>
References: <20251010225349.734350-3-markus.probst@posteo.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251010225349.734350-3-markus.probst@posteo.de>

Hi Markus,

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-leds/for-leds-next]
[also build test ERROR on v6.17]
[cannot apply to rust/rust-next rust/alloc-next linus/master next-20251010]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Markus-Probst/rust-add-basic-Pin-Vec-T-A-abstractions/20251011-065458
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/20251010225349.734350-3-markus.probst%40posteo.de
patch subject: [PATCH v3 2/2] rust: leds: add basic led classdev abstractions
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251012/202510121801.TbAguq2S-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251012/202510121801.TbAguq2S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510121801.TbAguq2S-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0277]: the trait bound `rust_doctest_kernel_alloc_kbox_rs_7::kernel::led::InitData<'_>: LedOps` is not satisfied
   --> rust/doctests_kernel_generated.rs:6097:6
   |
   6097 | /      KBox::pin_init(led::Device::new(
   6098 | |          None,
   6099 | |          None,
   6100 | |          led::InitData::new()
   6101 | |              .default_label(c_str!("my_led")),
   6102 | |          MyLedOps,
   6103 | |      ))
   | |_______^ the trait `LedOps` is not implemented for `rust_doctest_kernel_alloc_kbox_rs_7::kernel::led::InitData<'_>`
   |
   = help: the trait `LedOps` is implemented for `MyLedOps`
   note: required by a bound in `rust_doctest_kernel_alloc_kbox_rs_7::kernel::led::Device`
   --> rust/kernel/led.rs:26:22
   |
   26   | pub struct Device<T: LedOps> {
   |                      ^^^^^^ required by this bound in `Device`
--
>> error[E0277]: `UnsafeCell<MaybeUninit<rust_doctest_kernel_alloc_kbox_rs_7::kernel::bindings::fwnode_handle>>` cannot be shared between threads safely
   --> rust/doctests_kernel_generated.rs:6097:6
   |
   6097 | /      KBox::pin_init(led::Device::new(
   6098 | |          None,
   6099 | |          None,
   6100 | |          led::InitData::new()
   6101 | |              .default_label(c_str!("my_led")),
   6102 | |          MyLedOps,
   6103 | |      ))
   | |_______^ `UnsafeCell<MaybeUninit<rust_doctest_kernel_alloc_kbox_rs_7::kernel::bindings::fwnode_handle>>` cannot be shared between threads safely
   |
   = help: within `FwNode`, the trait `Sync` is not implemented for `UnsafeCell<MaybeUninit<rust_doctest_kernel_alloc_kbox_rs_7::kernel::bindings::fwnode_handle>>`
   note: required because it appears within the type `Opaque<rust_doctest_kernel_alloc_kbox_rs_7::kernel::bindings::fwnode_handle>`
   --> rust/kernel/types.rs:324:12
   |
   324  | pub struct Opaque<T> {
   |            ^^^^^^
   note: required because it appears within the type `FwNode`
   --> rust/kernel/device/property.rs:35:12
   |
   35   | pub struct FwNode(Opaque<bindings::fwnode_handle>);
   |            ^^^^^^
   = note: required for `&FwNode` to implement `Send`
   note: required because it appears within the type `Option<&FwNode>`
   --> /opt/cross/rustc-1.88.0-bindgen-0.72.0/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/option.rs:589:10
   |
   589  | pub enum Option<T> {
   |          ^^^^^^
   note: required because it appears within the type `rust_doctest_kernel_alloc_kbox_rs_7::kernel::led::InitData<'_>`
   --> rust/kernel/led.rs:36:12
   |
   36   | pub struct InitData<'a> {
   |            ^^^^^^^^
   = note: required for `Device<InitData<'_>>` to implement `Send`
   note: required by a bound in `Devres`
   --> rust/kernel/devres.rs:108:22
   |
   108  | pub struct Devres<T: Send> {
   |                      ^^^^ required by this bound in `Devres`
   = note: the full name for the type has been written to 'rust/doctests_kernel_generated.long-type-938713932875159562.txt'
   = note: consider using `--verbose` to print the full type name to the console
--
>> error[E0107]: missing generics for struct `rust_doctest_kernel_alloc_kbox_rs_7::kernel::led::Device`
   --> rust/doctests_kernel_generated.rs:6096:47
   |
   6096 |  fn register_my_led() -> Result<Pin<KBox<led::Device>>> {
   |                                               ^^^^^^ expected 1 generic argument
   |
   note: struct defined here, with 1 generic parameter: `T`
   --> rust/kernel/led.rs:26:12
   |
   26   | pub struct Device<T: LedOps> {
   |            ^^^^^^ -
   help: add missing generic argument
   |
   6096 |  fn register_my_led() -> Result<Pin<KBox<led::Device<T>>>> {
   |                                                     +++
--
>> error[E0277]: the trait bound `rust_doctest_kernel_alloc_kbox_rs_7::kernel::led::InitData<'_>: LedOps` is not satisfied
   --> rust/doctests_kernel_generated.rs:6100:10
   |
   6097 |        KBox::pin_init(led::Device::new(
   |                       ---------------- required by a bound introduced by this call
   ...
   6100 | /          led::InitData::new()
   6101 | |              .default_label(c_str!("my_led")),
   | |_____________________________________________^ the trait `LedOps` is not implemented for `rust_doctest_kernel_alloc_kbox_rs_7::kernel::led::InitData<'_>`
   |
   = help: the trait `LedOps` is implemented for `MyLedOps`
   note: required by a bound in `rust_doctest_kernel_alloc_kbox_rs_7::kernel::led::Device::<T>::new`
   --> rust/kernel/led.rs:168:9
   |
   168  | impl<T: LedOps> Device<T> {
   |         ^^^^^^ required by this bound in `Device::<T>::new`
   ...
   172  |     pub fn new<'a>(
   |            --- required by a bound in this associated function
--
>> error[E0277]: the trait bound `rust_doctest_kernel_alloc_kbox_rs_7::kernel::led::InitData<'_>: LedOps` is not satisfied
   --> rust/doctests_kernel_generated.rs:6097:21
   |
   6097 |        KBox::pin_init(led::Device::new(
   |  _____________________^
   6098 | |          None,
   6099 | |          None,
   6100 | |          led::InitData::new()
   6101 | |              .default_label(c_str!("my_led")),
   6102 | |          MyLedOps,
   6103 | |      ))
   | |______^ the trait `LedOps` is not implemented for `rust_doctest_kernel_alloc_kbox_rs_7::kernel::led::InitData<'_>`
   |
   = help: the trait `LedOps` is implemented for `MyLedOps`
   note: required by a bound in `rust_doctest_kernel_alloc_kbox_rs_7::kernel::led::Device<T>`
   --> rust/kernel/led.rs:168:9
   |
   168  | impl<T: LedOps> Device<T> {
   |         ^^^^^^ required by this bound in `Device<T>`
--
>> error[E0277]: the trait bound `rust_doctest_kernel_alloc_kbox_rs_7::kernel::led::InitData<'_>: LedOps` is not satisfied
   --> rust/doctests_kernel_generated.rs:6097:6
   |
   6097 |      KBox::pin_init(led::Device::new(
   |      ^^^^^^^^^^^^^^ the trait `LedOps` is not implemented for `rust_doctest_kernel_alloc_kbox_rs_7::kernel::led::InitData<'_>`
   |
   = help: the trait `LedOps` is implemented for `MyLedOps`
   note: required by a bound in `rust_doctest_kernel_alloc_kbox_rs_7::kernel::led::Device`
   --> rust/kernel/led.rs:26:22
   |
   26   | pub struct Device<T: LedOps> {
   |                      ^^^^^^ required by this bound in `Device`
--
>> error[E0277]: `UnsafeCell<MaybeUninit<rust_doctest_kernel_alloc_kbox_rs_7::kernel::bindings::fwnode_handle>>` cannot be shared between threads safely
   --> rust/doctests_kernel_generated.rs:6097:6
   |
   6097 |      KBox::pin_init(led::Device::new(
   |      ^^^^^^^^^^^^^^ `UnsafeCell<MaybeUninit<rust_doctest_kernel_alloc_kbox_rs_7::kernel::bindings::fwnode_handle>>` cannot be shared between threads safely
   |
   = help: within `FwNode`, the trait `Sync` is not implemented for `UnsafeCell<MaybeUninit<rust_doctest_kernel_alloc_kbox_rs_7::kernel::bindings::fwnode_handle>>`
   note: required because it appears within the type `Opaque<rust_doctest_kernel_alloc_kbox_rs_7::kernel::bindings::fwnode_handle>`
   --> rust/kernel/types.rs:324:12
   |
   324  | pub struct Opaque<T> {
   |            ^^^^^^
   note: required because it appears within the type `FwNode`
   --> rust/kernel/device/property.rs:35:12
   |
   35   | pub struct FwNode(Opaque<bindings::fwnode_handle>);
   |            ^^^^^^
   = note: required for `&FwNode` to implement `Send`
   note: required because it appears within the type `Option<&FwNode>`
   --> /opt/cross/rustc-1.88.0-bindgen-0.72.0/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/option.rs:589:10
   |
   589  | pub enum Option<T> {
   |          ^^^^^^
   note: required because it appears within the type `rust_doctest_kernel_alloc_kbox_rs_7::kernel::led::InitData<'_>`
   --> rust/kernel/led.rs:36:12
   |
   36   | pub struct InitData<'a> {
   |            ^^^^^^^^
   = note: required for `Device<InitData<'_>>` to implement `Send`
   note: required by a bound in `Devres`
   --> rust/kernel/devres.rs:108:22
   |
   108  | pub struct Devres<T: Send> {
   |                      ^^^^ required by this bound in `Devres`
   = note: the full name for the type has been written to 'rust/doctests_kernel_generated.long-type-938713932875159562.txt'
   = note: consider using `--verbose` to print the full type name to the console
--
>> error[E0277]: the trait bound `rust_doctest_kernel_alloc_kbox_rs_7::kernel::led::InitData<'_>: LedOps` is not satisfied
   --> rust/doctests_kernel_generated.rs:6097:6
   |
   6097 |      KBox::pin_init(led::Device::new(
   |      ^^^^ the trait `LedOps` is not implemented for `rust_doctest_kernel_alloc_kbox_rs_7::kernel::led::InitData<'_>`
   |
   = help: the trait `LedOps` is implemented for `MyLedOps`
   note: required by a bound in `rust_doctest_kernel_alloc_kbox_rs_7::kernel::led::Device`
   --> rust/kernel/led.rs:26:22
   |
   26   | pub struct Device<T: LedOps> {
   |                      ^^^^^^ required by this bound in `Device`
--
>> error[E0277]: `UnsafeCell<MaybeUninit<rust_doctest_kernel_alloc_kbox_rs_7::kernel::bindings::fwnode_handle>>` cannot be shared between threads safely
   --> rust/doctests_kernel_generated.rs:6097:6
   |
   6097 |      KBox::pin_init(led::Device::new(
   |      ^^^^ `UnsafeCell<MaybeUninit<rust_doctest_kernel_alloc_kbox_rs_7::kernel::bindings::fwnode_handle>>` cannot be shared between threads safely
   |
   = help: within `FwNode`, the trait `Sync` is not implemented for `UnsafeCell<MaybeUninit<rust_doctest_kernel_alloc_kbox_rs_7::kernel::bindings::fwnode_handle>>`
   note: required because it appears within the type `Opaque<rust_doctest_kernel_alloc_kbox_rs_7::kernel::bindings::fwnode_handle>`
   --> rust/kernel/types.rs:324:12
   |
   324  | pub struct Opaque<T> {
   |            ^^^^^^
   note: required because it appears within the type `FwNode`
   --> rust/kernel/device/property.rs:35:12
   |
   35   | pub struct FwNode(Opaque<bindings::fwnode_handle>);
   |            ^^^^^^
   = note: required for `&FwNode` to implement `Send`
   note: required because it appears within the type `Option<&FwNode>`
   --> /opt/cross/rustc-1.88.0-bindgen-0.72.0/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/option.rs:589:10
   |
   589  | pub enum Option<T> {
   |          ^^^^^^
   note: required because it appears within the type `rust_doctest_kernel_alloc_kbox_rs_7::kernel::led::InitData<'_>`
   --> rust/kernel/led.rs:36:12
   |
   36   | pub struct InitData<'a> {
   |            ^^^^^^^^
   = note: required for `Device<InitData<'_>>` to implement `Send`
   note: required by a bound in `Devres`
   --> rust/kernel/devres.rs:108:22
   |
   108  | pub struct Devres<T: Send> {
   |                      ^^^^ required by this bound in `Devres`
   = note: the full name for the type has been written to 'rust/doctests_kernel_generated.long-type-938713932875159562.txt'
   = note: consider using `--verbose` to print the full type name to the console

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

