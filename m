Return-Path: <linux-leds+bounces-8758-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Wx0YGGVKQmqT4AkAu9opvQ
	(envelope-from <linux-leds+bounces-8758-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 12:35:17 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D046D8F5C
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 12:35:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=NJk3AZTy;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8758-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8758-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1585D302295B
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 10:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94C6B3B71D6;
	Mon, 29 Jun 2026 10:31:54 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4967828CF5D;
	Mon, 29 Jun 2026 10:31:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782729114; cv=none; b=UUGQkQxF6RYP/a18oOXT3wQeVtTdRHbay/BmaYWQvxv8VCNDwk9w6VS2TWw7l5YwdhW7JH4s1kVlh+fldSVran1lJfCXrIhPdXoykaHosSU3u2EhRUxbmDB7C3mQgl8lgTFQrcH65lnsXPQQW3uOwIOjoPpezeZu0sWGsSQIsm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782729114; c=relaxed/simple;
	bh=Sz+/LuJFyc5hxBLteswIhIodEcHbba395Zs06Im87/8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=px8avvYZ4WULeoJdH6TjJsOUxYLVblqavZegf7zpqByHtJosXXt98W2nr4s5p3ZMTP2ssAEUpenmIXdQGz/rpQNeUmARv2XudaRLYQY2DNWUY1KwcQf7Nwvv1vpp37GueXvfJU/c5wLwbkRvi31lMCmpd8rRL8oM6CcGYzWRT+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NJk3AZTy; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 024461F000E9;
	Mon, 29 Jun 2026 10:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782729112;
	bh=r/P4urkfNnPMjPnBmZ60XyrvMfIM4ycf7CBb4sZTqGY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NJk3AZTyme8jcznYSk6QQzAMIB35nQ6F6gvH95xF4rUGcDcP49QAc6OuYAx8mEs87
	 ZFHMQmFOpPC6EJw0T+bU+DJurZVnsXPCA500spdVPTw9J4S0yp+5J1Xb8d9UQkls6i
	 swWH7Eb+Nl3OswN2zknQAhvL3AQR6LMOGtZ1j1yEOEzyes3iqBH8PZOAWYCC+TcTST
	 WjRsQ37xsTG6MfuWo2hQAS7M1xQ58G7zfl7mb98OlcL88wHWMFwyoblG4dtrcNTPq7
	 y6N2/kkLGuafYtjAMdoD5+vsWoZAjGK4r/48YoJ3rdH3ttPXrW6SKScuwENl87aYUU
	 oNXjUjYo6qRfA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v20 1/3] rust: leds: add basic led classdev abstractions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Probst" <markus.probst@posteo.de>
Cc: linux-leds@vger.kernel.org, lee@kernel.org, linux-pci@vger.kernel.org, ojeda@kernel.org
In-Reply-To: <20260629-rust_leds-v20-1-f493ab053b4f@posteo.de>
References: <20260629-rust_leds-v20-0-f493ab053b4f@posteo.de>
 <20260629-rust_leds-v20-1-f493ab053b4f@posteo.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 10:31:51 +0000
Message-Id: <20260629103152.024461F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8758-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,lists.linux.dev:replyto,vger.kernel.org:from_smtp,smtp.kernel.org:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,posteo.de:email];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:markus.probst@posteo.de,m:linux-leds@vger.kernel.org,m:lee@kernel.org,m:linux-pci@vger.kernel.org,m:ojeda@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A6D046D8F5C

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] FwNode reference count leak and underflow (Use-After-Free) due to =
retrieving fwnode from C device in drop
- [High] FwNode reference count is decremented before unregistering the LED=
 device, leading to a Use-After-Free during unregistration.
- [High] Lifetime erasure in `DeviceBuilder::build` allows `Device` to outl=
ive the `name` string, causing a dangling pointer in `led_classdev.name`.
- [High] Creating `&mut usize` from shared C-provided pointers in `blink_se=
t_callback` violates Rust's exclusive mutability guarantee (Undefined Behav=
ior).
--

commit 5790f9c92f07b2ed588fa76855369d33b813c58c
Author: Markus Probst <markus.probst@posteo.de>

rust: leds: add basic led classdev abstractions
   =20
Implement the core abstractions needed for led class devices, including:

* `led::LedOps` - the trait for handling leds, including
  `brightness_set`, `brightness_get` and `blink_set`

* `led::DeviceBuilder` - the builder for the led class device

* `led::Device` - a safe wrapper around `led_classdev`

> diff --git a/rust/kernel/led/normal.rs b/rust/kernel/led/normal.rs
> new file mode 100644
> index 0000000000000..a294c96b34dc2
> --- /dev/null
> +++ b/rust/kernel/led/normal.rs
[ ... ]
> +impl<'a, S: DeviceBuilderState> DeviceBuilder<'a, S> {
> +    /// Registers a new [`Device`].
> +    pub fn build<'bound: 'a, T: LedOps + 'bound>(
> +        self,
> +        parent: &'bound T::Bus,
> +        ops: impl PinInit<T, Error> + 'a,
> +    ) -> impl PinInit<Device<'bound, T>, Error> + 'a {
> +        const_assert!(T::MAX_BRIGHTNESS <=3D i32::MAX.unsigned_abs() || =
!T::HAS_BRIGHTNESS_GET);
> +
> +        try_pin_init!(Device {
> +            ops <- ops,
> +            classdev <- Opaque::try_ffi_init(|ptr: *mut bindings::led_cl=
assdev| {
> +                // SAFETY: `try_ffi_init` guarantees that `ptr` is valid=
 for write.
> +                // `led_classdev` gets fully initialized in-place by
> +                // `led_classdev_register_ext` including `mutex` and `li=
st_head`.
> +                unsafe {
> +                    ptr.write(bindings::led_classdev {
> +                        brightness_set: (!T::BLOCKING)
> +                            .then_some(Adapter::<T>::brightness_set_call=
back),
> +                        brightness_set_blocking: T::BLOCKING
> +                            .then_some(Adapter::<T>::brightness_set_bloc=
king_callback),
> +                        brightness_get: T::HAS_BRIGHTNESS_GET
> +                            .then_some(Adapter::<T>::brightness_get_call=
back),
> +                        blink_set: T::HAS_BLINK_SET.then_some(Adapter::<=
T>::blink_set_callback),
> +                        max_brightness: T::MAX_BRIGHTNESS,
> +                        brightness: self.initial_brightness,
> +                        color: self.color as u32,
> +                        name: self.name.map_or(core::ptr::null(), CStrEx=
t::as_char_ptr),
                         ^^^^

[Severity: High]
Does this allow `Device` to outlive the `name` string, leaving a dangling
pointer in `led_classdev.name`?

The `DeviceBuilder` accepts a short-lived `name: &'a CStr`, and the pointer
is copied into the C `led_classdev` struct. The returned `Device<'bound, T>`
only enforces `'bound: 'a` (meaning `'bound` outlives `'a`). Because the
resulting `Device` type itself does not capture the `'a` lifetime, the Rust
borrow checker allows the `Device` to outlive the `name` string.

If a driver uses a dynamically allocated local string or a short-lived form=
at
buffer for the device name, will this leave a dangling pointer that gets
triggered upon system suspend/resume?

> +                        ..bindings::led_classdev::default()
> +                    })
> +                };
[ ... ]
> +    unsafe extern "C" fn blink_set_callback(
> +        led_cdev: *mut bindings::led_classdev,
> +        delay_on: *mut usize,
> +        delay_off: *mut usize,
> +    ) -> i32 {
> +        from_result(|| {
> +            // SAFETY: The function's contract guarantees that `led_cdev=
` is a valid pointer to a
> +            // `led_classdev` embedded within a `led::Device`.
> +            let classdev =3D unsafe { Device::<T>::from_raw(led_cdev) };
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
                 ^^^^

[Severity: High]
Does creating `&mut usize` from these shared C-provided pointers violate
Rust's exclusive mutability guarantees?

In `Adapter::blink_set_callback`, the raw pointers `delay_on` and `delay_of=
f`
are unconditionally cast to exclusive Rust references (`&mut usize`). These
pointers are passed from the C LED core, where they directly point to the
`led_cdev->blink_delay_on` and `blink_delay_off` fields.

Since these same fields are concurrently readable by lockless sysfs functio=
ns
like `led_delay_on_show()`, they can be read concurrently while the `&mut`
reference is alive. Does this result in undefined behavior since they are n=
ot
exclusively owned by the callback?

> +                // SAFETY: The function's contract guarantees that `dela=
y_off` points to a `usize`
> +                // and is exclusive for the period of this function.
> +                unsafe { &mut *delay_off },
> +            )?;
> +            Ok(0)
> +        })
> +    }
[ ... ]
> +#[pinned_drop]
> +impl<'bound, T: LedOps + 'bound> PinnedDrop for Device<'bound, T> {
> +    fn drop(self: Pin<&mut Self>) {
> +        let raw =3D self.classdev.get();
> +        // SAFETY: The existence of `self` guarantees that `self.classde=
v.get()` is a pointer to a
> +        // valid `led_classdev`.
> +        let dev: &device::Device =3D unsafe { device::Device::from_raw((=
*raw).dev) };
> +
> +        if let Some(fwnode) =3D dev.fwnode() {
> +            // SAFETY: the reference count of `fwnode` has previously be=
en incremented in
> +            // `led::DeviceBuilder::build`.
> +            unsafe { FwNode::dec_ref(NonNull::from(fwnode)) };
                 ^^^^

[Severity: High]
Can this cause a reference count underflow and use-after-free for the fwnod=
e?

If `DeviceBuilder::build()` is called without an explicitly provided `fwnod=
e`,
it does not leak a reference. However, during registration, the C core
`device_add()` automatically inherits the parent's `fwnode` if the device
has none.

Later, in `PinnedDrop::drop()`, this code blindly calls `dev.fwnode()` and
decrements its reference count. Doesn't this erroneously decrement the pare=
nt
device's `fwnode` reference count, which it never owned?

> +        }
> +
> +        // SAFETY: The existence of `self` guarantees that `self.classde=
v` has previously been
> +        // successfully registered with `led_classdev_register_ext`.
> +        unsafe { bindings::led_classdev_unregister(raw) };
                 ^^^^

[Severity: High]
Is it safe to decrement the fwnode reference count before unregistering the
LED device?

The `FwNode::dec_ref()` call happens before
`bindings::led_classdev_unregister()`. If this was the last reference, the
fwnode is immediately freed. Then, `led_classdev_unregister()` calls
`device_unregister()` and subsequently `device_del()`. Inside `device_del()=
`,
the core driver framework accesses `dev->fwnode`.

Could this result in a use-after-free when the C core attempts to access the
fwnode to clean up software nodes and links?

> +    }
> +}

Note: The issues regarding `DeviceBuilder::build`, `blink_set_callback`, and
`PinnedDrop::drop` appear to also apply to `MultiColorDevice` in
`rust/kernel/led/multicolor.rs`.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-rust_leds-=
v20-0-f493ab053b4f@posteo.de?part=3D1

