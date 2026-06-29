Return-Path: <linux-leds+bounces-8775-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FzW7BOt2Qmpk7wkAu9opvQ
	(envelope-from <linux-leds+bounces-8775-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 15:45:15 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4866DB72C
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 15:45:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=R8KowhHJ;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8775-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8775-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7E8AF30068DD
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 13:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABE2A202F70;
	Mon, 29 Jun 2026 13:36:29 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CF11C8604;
	Mon, 29 Jun 2026 13:36:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782740189; cv=none; b=t2aVpHDmsfGZCavFBtDWErOYJWvcWl+r+/NJy1f/wTVpvlNYD837Pd4jmNIllwkLjraZaRr0CUxBO/0s72ORyUayVGfJqpRu/WptRpqDwvdEa5irzR8jq9OvxDCPGJWM6gL6mSqssz9melYtfwrf57dPwIbiBz2bvoJMIYQ+028=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782740189; c=relaxed/simple;
	bh=mcZyJUk1npepSg8RinS0ZsMEuDP8upSviZkiCiHl5BY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ka0bxcy5fo1EolTYYaJiiRyuP1OvT7D+ktBzl4NN0XpUo7Sa84wXS5g57SaAhoC+N7xTF/H/Dv60JSk3cEY2ipPqVXwdIbroDI0YVrQZzLdhe7/VKH9dPlLLR2SzVgFaTmQ5ecFDuGaMSecaQt8RN0W0EpFauVzV93xHPHpGkq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R8KowhHJ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A68C11F00A3A;
	Mon, 29 Jun 2026 13:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782740188;
	bh=FuM/CmGZZOV5HHQD+7UUU254gmMHr9HS4jMiTyEs7l8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R8KowhHJrHm5QXnE7EguCvbeJFYJ9a5nyhThGgPRJHXBlkOH6s2qfYqCdBxnC4BpT
	 3C43k2PhKTgZuEyrCBqcRyaM8CKnMOgBYiTFIeP+v5qXImlvNMgiRDNKje7IVLlfqW
	 UQvSDcu3/XP+nueCXUuRMuAFE3/c1/C4vC/DtWpZWOqlLeDdtelJ7buYNqTM0yvMvy
	 tPWAsO3LkPZSSM4yZUVsWLXKLcVHEt8cm6hDE0nLQ9AB6AHTYZFdMc+1EHnkXbi1m6
	 6rS6HosY8NoHsrLM3XlNM2IA3/jCIEj8bhx7c+ntTohwnZHsW0psdHDw7mxhzRBb3l
	 0uYHCQPoT68xw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v21 1/3] rust: leds: add basic led classdev abstractions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Probst" <markus.probst@posteo.de>
Cc: linux-pci@vger.kernel.org, ojeda@kernel.org, linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260629-rust_leds-v21-1-4f0f19579db5@posteo.de>
References: <20260629-rust_leds-v21-0-4f0f19579db5@posteo.de>
 <20260629-rust_leds-v21-1-4f0f19579db5@posteo.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 13:36:27 +0000
Message-Id: <20260629133627.A68C11F00A3A@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8775-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,smtp.kernel.org:mid,sashiko.dev:url,posteo.de:email,led_classdev.name:url];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:markus.probst@posteo.de,m:linux-pci@vger.kernel.org,m:ojeda@kernel.org,m:linux-leds@vger.kernel.org,m:lee@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7F4866DB72C

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The `blink_set_callback` creates multiple mutable references (`&mu=
t usize`) to the same shared memory concurrently, violating Rust's strict a=
liasing rules.
- [High] The `DeviceBuilder::build` method erases the lifetime of the `name=
` string, allowing the `led_classdev.name` pointer to outlive the string an=
d causing a Use-After-Free.
- [High] Unsound `FwNode` reference count management in `Device::drop` retr=
ieves the `fwnode` directly from the mutable C structure, leading to refcou=
nt underflow and Use-After-Free.
--

commit d59e3e50bab36d2a8936041aa09ed5823876969f
Author: Markus Probst <markus.probst@posteo.de>

rust: leds: add basic led classdev abstractions

Implement the core abstractions needed for led class devices, including
LedOps, DeviceBuilder, and Device.

> diff --git a/rust/kernel/led/normal.rs b/rust/kernel/led/normal.rs
> new file mode 100644
> index 0000000000000..2769f690bb245
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

[Severity: High]
Is the lifetime bound <'bound: 'a> backwards here?

By specifying 'bound: 'a, the returned Device ('bound) is explicitly permit=
ted
to outlive the builder's string lifetime ('a).

Because the raw pointer to this string is written directly into the
led_classdev.name field, a driver could initialize a Device with a temporary
string, which drops the string while leaving led_cdev->name dangling. Can
this lead to a use-after-free?

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
> +                // SAFETY: The function's contract guarantees that `dela=
y_off` points to a `usize`
> +                // and is exclusive for the period of this function.
> +                unsafe { &mut *delay_off },
> +            )?;

[Severity: High]
Could this lead to a strict aliasing violation by creating multiple mutable
references to the same shared memory concurrently?

In the C LED subsystem, sysfs write operations to delay_on and delay_off can
invoke led_blink_set() concurrently across different threads without holding
locks on the device.

This passes pointers to the shared led_cdev->blink_delay_on and
led_cdev->blink_delay_off fields directly into the blink_set callback. By
unconditionally casting these raw C pointers to &mut usize in Rust, the
callback can create overlapping mutable references to the exact same memory
locations.

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
> +        let _fwnode =3D dev
> +            .fwnode()
> +            // SAFETY: the reference count of `fwnode` has previously be=
en
> +            // incremented in `led::DeviceBuilder::build`.
> +            .map(|fwnode| unsafe { ARef::from_raw(NonNull::from(fwnode))=
 });

[Severity: High]
Does this unsoundly steal a reference count from the C field dev->fwnode?

In DeviceBuilder::build, self.fwnode is passed to C and its refcount is
leaked via core::mem::forget. However, if self.fwnode was initially None, no
reference count is leaked.

If dev->fwnode is subsequently populated by external C code, this
PinnedDrop implementation blindly constructs an ARef and drops it. Since
Rust never incremented this refcount, could this result in an underflow
and an eventual use-after-free of the FwNode?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-rust_leds-=
v21-0-4f0f19579db5@posteo.de?part=3D1

