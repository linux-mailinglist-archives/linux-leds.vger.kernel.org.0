Return-Path: <linux-leds+bounces-8759-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ALaxBCFKQmpf4AkAu9opvQ
	(envelope-from <linux-leds+bounces-8759-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 12:34:09 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8836D8F17
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 12:34:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ftBFOkCF;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8759-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-leds+bounces-8759-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 004583011374
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 10:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE14C3B8D5C;
	Mon, 29 Jun 2026 10:34:03 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5563B9931;
	Mon, 29 Jun 2026 10:34:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782729243; cv=none; b=kUiPTy7cgVpBR+tzfn6N0rqR9jc10ECtJhhKfMjjA2eYqNzHZFH0xVMgRo3FuZyKmXXwwy19V96E/3vNTRlSAEePMvoP9Yq/vBUo5cv0PD/bX5+JyvYWGOMKuQdWe+YOMc/bLpwfeLUKSQisEtxljMxRZYRlvMZKTTVLPv4+clE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782729243; c=relaxed/simple;
	bh=VyUCor/O793CbHEyLS4Nb1fmngDQApWZdGDOwncsBVI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dx4PgrIqSxTWWYbHp1x5UEWunvRHvlFHb3ntUoHpaQNSs1r9AMvSRBzVU9Caro9191VmQKac5Yhh/5VPbC44Mh9qqZswLqtZliezrj8yqE+8kOLzcmT8A6xvzaNncpVo/m2666LtjpXsLkeETzn7T2lBUpDFqwdy09wpryOtPP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ftBFOkCF; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F7A61F000E9;
	Mon, 29 Jun 2026 10:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782729242;
	bh=CKr9yTXKmPrgr2I81oEY09QC31oJEOqWCYm/YdreA+o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ftBFOkCFP666HaFFiabKrPvfWiIIQPcApNNml3LmToQwH8fUBx9ehPeDBh1822Spr
	 9VWZ6KU1vu+RioslE/5ULZ7T10p3/ZPjBeRqlDd8ylTNGhvD+EVuVAYH81MmJDLW6b
	 O0JGdK8aSiMWndB1wjRYa1fb4rXKnTZdEg+KnKGLrmaCQ9kVorEFrOsyp7KPgezOZd
	 0YRyQGGCDAQCjexDEJjRfhAxVqpicOgHiwK6Nm7DljQvUbb06GFJcTiBSu5VvXIf19
	 FX74B9giNHW7nML4ORdmkGSiyQKCU2YX1gqIZzGgP4AjT2EgcAtTNDhzHbhTilDuMv
	 lfuyr7756Udig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v20 3/3] rust: leds: add multicolor classdev
 abstractions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Probst" <markus.probst@posteo.de>
Cc: linux-pci@vger.kernel.org, lee@kernel.org, linux-leds@vger.kernel.org, ojeda@kernel.org
In-Reply-To: <20260629-rust_leds-v20-3-f493ab053b4f@posteo.de>
References: <20260629-rust_leds-v20-0-f493ab053b4f@posteo.de>
 <20260629-rust_leds-v20-3-f493ab053b4f@posteo.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 10:34:00 +0000
Message-Id: <20260629103401.7F7A61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8759-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,posteo.de:email,lists.linux.dev:replyto,vger.kernel.org:from_smtp,sashiko.dev:url,self.name:url];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:markus.probst@posteo.de,m:linux-pci@vger.kernel.org,m:lee@kernel.org,m:linux-leds@vger.kernel.org,m:ojeda@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A8836D8F17

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Unsynchronized lockless reads in `intensity()` and `brightness()` =
cause Undefined Behavior.
- [High] Dangling pointer in `led_cdev.name` due to builder lifetime mismat=
ch.
- [High] Incorrect fwnode reference counting leads to memory leaks and Use-=
After-Free.
- [Low] Copy-paste error in safety comment for MultiColorSubLed::brightness=
().
--

commit e54d5ad0bd9b464f2f25c0f6cb8f040e94fe0402
Author: Markus Probst <markus.probst@posteo.de>

rust: leds: add multicolor classdev abstractions

This commit implements the abstractions needed for multicolor LED class
devices. It introduces the MultiColor mode, MultiColorSubLed,
MultiColorDevice, and the DeviceBuilder::build_multicolor function for
registration.

> diff --git a/rust/kernel/led/multicolor.rs b/rust/kernel/led/multicolor.rs
> new file mode 100644
> index 0000000000000..9a341b3336489
> --- /dev/null
> +++ b/rust/kernel/led/multicolor.rs

[ ... ]

> +    pub const fn intensity(&self) -> u32 {
> +        // SAFETY:
> +        // - `self.intensity.get()` is a valid pointer to `u32`.
> +        // - We don't have exclusive or immutable access to `self.intens=
ity`,
> +        //   but the alignment should prevent "load tearing".
> +        unsafe { *self.intensity.get() }
> +    }

[Severity: High]
Could this plain read cause undefined behavior?

The C LED subsystem updates the intensity and brightness fields directly,
often while holding the led_access mutex. Since this read from the
UnsafeCell is performed without atomic synchronization or read_volatile,
can it race with C-side updates if called from an unsynchronized driver
context?

> +    /// The brightness of the sub led.
> +    #[inline]
> +    pub const fn brightness(&self) -> u32 {
> +        // SAFETY:
> +        // - `self.intensity.get()` is a valid pointer to `u32`.

[Severity: Low]
This isn't a bug, but there is a typo in this safety comment. It references
self.intensity.get() instead of self.brightness.get().

> +        // - We don't have exclusive or immutable access to `self.bright=
ness`,
> +        //   but the alignment should prevent "load tearing".
> +        unsafe { *self.brightness.get() }
> +    }

[Severity: High]
Similar to the intensity() method, does this plain unsynchronized read of
brightness risk undefined behavior if the C side modifies it concurrently?

[ ... ]

> +impl<'a, S: DeviceBuilderState> DeviceBuilder<'a, S> {
> +    /// Registers a new [`MulticolorDevice`].
> +    pub fn build_multicolor<'bound: 'a, T: LedOps<Mode =3D MultiColor> +=
 'bound>(
> +        self,
> +        parent: &'bound T::Bus,
> +        ops: impl PinInit<T, Error> + 'a,
> +        subleds: &'a [MultiColorSubLed],
> +    ) -> impl PinInit<MultiColorDevice<'bound, T>, Error> + 'a {

[ ... ]

> +                // SAFETY: `try_ffi_init` guarantees that `ptr` is valid=
 for write.
> +                // `led_classdev_mc` gets fully initialized in-place by
> +                // `led_classdev_multicolor_register_ext` including `mut=
ex` and `list_head`.
> +                unsafe {
> +                    ptr.write(bindings::led_classdev_mc {
> +                        led_cdev: bindings::led_classdev {
> +                            brightness_set: (!T::BLOCKING)
> +                                .then_some(Adapter::<T>::brightness_set_=
callback),
> +                            brightness_set_blocking: T::BLOCKING
> +                                .then_some(Adapter::<T>::brightness_set_=
blocking_callback),
> +                            brightness_get: T::HAS_BRIGHTNESS_GET
> +                                .then_some(Adapter::<T>::brightness_get_=
callback),
> +                            blink_set: T::HAS_BLINK_SET.then_some(Adapte=
r::<T>::blink_set_callback),
> +                            max_brightness: T::MAX_BRIGHTNESS,
> +                            brightness: self.initial_brightness,
> +                            color: self.color as u32,
> +                            name: self.name.map_or(core::ptr::null(), CS=
trExt::as_char_ptr),

[Severity: High]
Is there a risk of a dangling pointer here?

The DeviceBuilder borrows self.name for a lifetime 'a, but the resulting
MultiColorDevice only captures the 'bound lifetime. This drops the 'a
constraint, meaning the caller could safely drop the original CStr
immediately after initialization.

Since the C subsystem bypasses internal name generation and retains this
pointer if self.name is provided, could this lead to a use-after-free
when sysfs accesses the name later?

> +                            ..bindings::led_classdev::default()
> +                        },

[ ... ]

> +                let mut init_data =3D bindings::led_init_data {
> +                    fwnode: self
> +                        .fwnode
> +                        .as_ref()
> +                        .map_or(core::ptr::null_mut(), |fwnode| fwnode.a=
s_raw()),
> +                    default_label: core::ptr::null(),
> +                    devicename: self
> +                        .devicename
> +                        .map_or(core::ptr::null(), CStrExt::as_char_ptr),
> +                    devname_mandatory: self.devname_mandatory,
> +                };
> +
> +                // SAFETY:
> +                // - `parent.as_ref().as_raw()` is guaranteed to be a po=
inter to a valid
> +                //    `device`.
> +                // - `ptr` is guaranteed to be a pointer to an initializ=
ed `led_classdev_mc`.
> +                to_result(unsafe {
> +                    bindings::led_classdev_multicolor_register_ext(
> +                        parent.as_ref().as_raw(),
> +                        ptr,
> +                        if self.name.is_none() {
> +                            &raw mut init_data
> +                        } else {
> +                            core::ptr::null_mut()
> +                        },
> +                    )
> +                })?;
> +
> +                subled_guard.dismiss();
> +
> +                core::mem::forget(self.fwnode); // keep the reference co=
unt incremented

[Severity: High]
Does this cause a memory leak when self.name is provided?

If self.name.is_some(), the register call is passed a null pointer instead
of the init_data. This prevents the C subsystem from attaching the fwnode
to the device.

However, core::mem::forget(self.fwnode) is still called unconditionally,
which seems like it would permanently leak the reference count for the
fwnode when the subsystem didn't actually take ownership of it.

> +
> +                Ok::<_, Error>(())
> +            }),

[ ... ]

> +#[pinned_drop]
> +impl<'bound, T: LedOps<Mode =3D MultiColor> + 'bound> PinnedDrop for Mul=
tiColorDevice<'bound, T> {
> +    fn drop(self: Pin<&mut Self>) {
> +        let raw =3D self.classdev.get();
> +        // SAFETY: The existence of `self` guarantees that `self.classde=
v.get()` is a pointer to a
> +        // valid `led_classdev_mc`.
> +        let dev: &device::Device =3D unsafe { device::Device::from_raw((=
*raw).led_cdev.dev) };
> +
> +        if let Some(fwnode) =3D dev.fwnode() {
> +            // SAFETY: the reference count of `fwnode` has previously be=
en incremented in
> +            // `led::DeviceBuilder::build_multicolor`.
> +            unsafe { FwNode::dec_ref(NonNull::from(fwnode)) };
> +        }
> +
> +        // SAFETY: The existence of `self` guarantees that `self.classde=
v` has previously been
> +        // successfully registered with `led_classdev_multicolor_registe=
r_ext`.
> +        unsafe { bindings::led_classdev_multicolor_unregister(raw) };

[Severity: High]
Could dropping the fwnode reference before unregistering the device lead
to a use-after-free?

Unregistering the device calls device_del(), which may access dev->fwnode
for kobject_uevent or fwnode_links_read.

Since FwNode::dec_ref() is called first, the fwnode might already be freed
by the time the unregister function accesses it.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-rust_leds-=
v20-0-f493ab053b4f@posteo.de?part=3D3

