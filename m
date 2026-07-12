Return-Path: <linux-leds+bounces-9048-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jYJJLZLRU2oefQMAu9opvQ
	(envelope-from <linux-leds+bounces-9048-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2026 19:40:34 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1014A745828
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2026 19:40:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=coNf2oL7;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9048-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-9048-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0F7D23002788
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2026 17:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 525AF3438A4;
	Sun, 12 Jul 2026 17:40:32 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B422222AC;
	Sun, 12 Jul 2026 17:40:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783878032; cv=none; b=eJDlw/qRMH6cYL9YykomrGrjQWGXEQc8gCGZR1RXo/UyvoTG5D8hyteyALQ7BySqMSQeBp6YdyFARhcpTWaiUxLYYai6rn13fRjSgRr19AK+RS50gvt6SFwxfITdVWanoAhFt/oheN8rcNCzJqsCZGd0aM3A1VlLLMY8+EGAlBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783878032; c=relaxed/simple;
	bh=Vq/RjhJjw5FTPWM3z/3GhAeJ9ioevRCKCw0qwLH4f38=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bPPEdnvUq3PhUAypf8Qs351KP5YzbnZSeO3n6ZzPifsa1wr5sK58YS7Sq/acuqkq3aRBhpmRXb/ROiWcekoYepCtLhBL32YaZM/wKX/11u9AwMMvZchTVzypF2mcQn0PiQhNeACBpciDfLzht6TKgabIXVintU4j6UOC5ub9kqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=coNf2oL7; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93A541F000E9;
	Sun, 12 Jul 2026 17:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783878030;
	bh=/LE3Z4xNgDNx+kC8RrvqdvOSLWk0mwObmQAyGca+Qi0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=coNf2oL7JleumDn9KqfJnW3I0f1E2WhKxfIkIMczvUdRgWnYW1q8dKH2QWu+F5tNn
	 EE+dGcCosCG+os6qlQHfEm+elgYQijyF0IIf4zn/pSN2IDr1WCBpmXi5/3woQJ1IlB
	 +raII4cq0/sXv8mzeZeWueFPQPckF5HukVOp+4rXeSdEH5+ozY/1VBTK0Y3sGPj5gp
	 VbhmNRjEfjhOJ+hDagOoEBaS6S3o5DHwUd8Op72BFAvv2c13LKdbHAwVBAcb9VvLL/
	 ++iZ4aAFw0GNq7T9apX0sUrbY3MWKRZ//gFUlD4SFrnXZnH+PlXuqzDuIzgBLUADiK
	 qkxyomQ40rkVw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v22 3/3] rust: leds: add multicolor classdev
 abstractions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Probst" <markus.probst@posteo.de>
Cc: lee@kernel.org, linux-pci@vger.kernel.org, linux-leds@vger.kernel.org, ojeda@kernel.org
In-Reply-To: <20260712-rust_leds-v22-3-055b0459a079@posteo.de>
References: <20260712-rust_leds-v22-0-055b0459a079@posteo.de>
 <20260712-rust_leds-v22-3-055b0459a079@posteo.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 12 Jul 2026 17:40:29 +0000
Message-Id: <20260712174029.93A541F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-9048-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,posteo.de:email,smtp.kernel.org:mid];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:markus.probst@posteo.de,m:lee@kernel.org,m:linux-pci@vger.kernel.org,m:linux-leds@vger.kernel.org,m:ojeda@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1014A745828

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Data race and Undefined Behavior in `MultiColorSubLed` field acces=
sors due to plain non-volatile reads.
- [High] Fwnode reference leak and potential Use-After-Free due to conditio=
nal failure to pass `init_data`.
- [High] `led_mc_calc_color_components` is invoked without driver locks, ca=
using data races on `subled_info`.
- [High] The `blink_set_callback` constructs `&mut usize` references to `de=
lay_on` and `delay_off` while they may be concurrently read by the C subsys=
tem, violating Rust's strict aliasing rules.
- [Low] The commit message capitalization does not follow the LED subsystem=
 guidelines.
--

--- Patch [3]: [PATCH v22 3/3] rust: leds: add multicolor classdev abstract=
ions ---
commit d8a204f9781a723e65e93fe2f08ed4aaa56bb20f
Author: Markus Probst <markus.probst@posteo.de>

rust: leds: add multicolor classdev abstractions

This commit implements the abstractions needed for multicolor led class
devices. It introduces the led::MultiColor mode implementation, safe wrappe=
rs
for led_classdev_mc and mc_subled, and a device registration function.

> rust: leds: add multicolor classdev abstractions

[Severity: Low]
This isn't a bug, but does the commit message capitalization follow the LED
subsystem guidelines?=20

The guidelines require capitalizing the description after the subsystem pre=
fix,
such as "rust: leds: Add multicolor classdev abstractions".

> diff --git a/rust/kernel/led/multicolor.rs b/rust/kernel/led/multicolor.rs
> new file mode 100644
> index 0000000000000..82fe96fd5273b
> --- /dev/null
> +++ b/rust/kernel/led/multicolor.rs
[ ... ]
> +    /// The intensity of the sub led.
> +    #[inline]
> +    pub const fn intensity(&self) -> u32 {
> +        // SAFETY:
> +        // - `self.intensity.get()` is a valid pointer to `u32`.
> +        // - We don't have exclusive or immutable access to `self.intens=
ity`,
> +        //   but the alignment should prevent "load tearing".
> +        unsafe { *self.intensity.get() }

[Severity: High]
Can this lead to a data race and undefined behavior?=20

The C LED subsystem might mutate the intensity concurrently, for instance v=
ia
sysfs writes like multi_intensity_store().

In Rust's memory model, concurrent non-atomic reads and writes to identical
memory locations constitute a data race regardless of alignment.=20

Would it be safer to use core::ptr::read_volatile() here?

> +    }
> +
> +    /// The brightness of the sub led.
> +    #[inline]
> +    pub const fn brightness(&self) -> u32 {
> +        // SAFETY:
> +        // - `self.brightness.get()` is a valid pointer to `u32`.
> +        // - We don't have exclusive or immutable access to `self.bright=
ness`,
> +        //   but the alignment should prevent "load tearing".
> +        unsafe { *self.brightness.get() }

[Severity: High]
Similarly, could concurrent sysfs writes mutate the brightness while it's
being read here?=20

Using a plain read instead of read_volatile might lead to data races and
undefined behavior for the same reasons as intensity().

[ ... ]
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
Does this sequence potentially cause a memory leak or a use-after-free of t=
he
fwnode?

When a custom name is used (self.name.is_some()), init_data is omitted and
null_mut() is passed to led_classdev_multicolor_register_ext(), preventing
the C device from inheriting the fwnode.

However, core::mem::forget(self.fwnode) is called unconditionally.

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
> +        let _fwnode =3D dev
> +            .fwnode()
> +            // SAFETY: the reference count of `fwnode` has previously be=
en
> +            // incremented in `led::DeviceBuilder::build_multicolor`.
> +            .map(|fwnode| unsafe { ARef::from_raw(NonNull::from(fwnode))=
 });

[Severity: High]
If init_data wasn't passed during registration, won't dev.fwnode() either
return null (permanently leaking the ARef) or return an inherited fwnode
from a parent device?

If it inherits a parent's fwnode, this code seems like it would drop a
reference it never owned, resulting in a use-after-free.

[ ... ]
> +    unsafe extern "C" fn brightness_set_callback(
> +        led_cdev: *mut bindings::led_classdev,
> +        brightness: u32,
> +    ) {
> +        // SAFETY: The function's contract guarantees that `led_cdev` is=
 a valid pointer to a
> +        // `led_classdev` embedded within a `led::MultiColorDevice`.
> +        let classdev =3D unsafe { MultiColorDevice::<T>::from_raw(led_cd=
ev) };
> +        // SAFETY: `classdev.parent()` is guaranteed to be contained in =
`T::Bus`.
> +        let parent =3D unsafe { T::Bus::from_device(classdev.parent()) };
> +
> +        // SAFETY: `classdev.classdev.get()` is guaranteed to be a point=
er to a valid
> +        // `led_classdev_mc`.
> +        unsafe { bindings::led_mc_calc_color_components(classdev.classde=
v.get(), brightness) };
> +
> +        let _ =3D classdev.ops.brightness_set(parent, classdev, brightne=
ss);
> +    }

[Severity: High]
Could calling led_mc_calc_color_components unconditionally before dispatchi=
ng
to the driver's brightness_set callback lead to data races?

The LED core doesn't serialize brightness_set calls. Hardware triggers and
sysfs writes could occur concurrently.

Normally in C drivers, led_mc_calc_color_components is invoked manually
inside the driver's lock to protect concurrent writes to
subled_info[i].brightness.=20

By executing it here outside the driver's callback, doesn't it make it
impossible for the driver to protect the calculation?

[ ... ]
> +    unsafe extern "C" fn blink_set_callback(
> +        led_cdev: *mut bindings::led_classdev,
> +        delay_on: *mut usize,
> +        delay_off: *mut usize,
> +    ) -> i32 {
> +        from_result(|| {
> +            // SAFETY: The function's contract guarantees that `led_cdev=
` is a valid pointer to a
> +            // `led_classdev` embedded within a `led::MultiColorDevice`.
> +            let classdev =3D unsafe { MultiColorDevice::<T>::from_raw(le=
d_cdev) };
> +            // SAFETY: `classdev.parent()` is guaranteed to be contained=
 in `T::Bus`.
> +            let parent =3D unsafe { T::Bus::from_device(classdev.parent(=
)) };
> +
> +            classdev.ops.blink_set(
> +                parent,
> +                classdev,
> +                // SAFETY: The function's contract guarantees that `dela=
y_on` points to a `usize`
> +                // and is exclusive for the period of this function.
> +                unsafe { &mut *delay_on },
> +                // SAFETY: The function's contract guarantees that `dela=
y_off` points to a `usize`
> +                // and is exclusive for the period of this function.
> +                unsafe { &mut *delay_off },
> +            )?;

[Severity: High]
Does casting delay_on and delay_off to exclusive mutable references=20
(&mut usize) violate strict aliasing?

These FFI pointers point to led_cdev->blink_delay_on and blink_delay_off,
which the C subsystem allows to be read locklessly via sysfs
(e.g., delay_on_show()).

Since Rust's &mut T guarantees absolutely exclusive access, a concurrent
read from C would invalidate this contract and cause undefined behavior.

Should these be passed as raw pointers or use interior mutability types?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260712-rust_leds-=
v22-0-055b0459a079@posteo.de?part=3D3

