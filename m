Return-Path: <linux-leds+bounces-7365-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDdTNHkJuGkWYQEAu9opvQ
	(envelope-from <linux-leds+bounces-7365-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 16 Mar 2026 14:45:29 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B0E29AADA
	for <lists+linux-leds@lfdr.de>; Mon, 16 Mar 2026 14:45:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A18D83010937
	for <lists+linux-leds@lfdr.de>; Mon, 16 Mar 2026 13:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BF3939A06D;
	Mon, 16 Mar 2026 13:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="jb8ZJO47"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4C639A04A
	for <linux-leds@vger.kernel.org>; Mon, 16 Mar 2026 13:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773668629; cv=none; b=tyHD/1CuEGdiz9taOYy/6dsCvFR/a57AUKigKNhdHr8sGZHHCd313G541TK3l5vhl3IY9YZzOTPDTBfX+gnpp+zbFJrMRQmZXEM3MATfWyayXhF+zFrqp6fuINtyZaim+ovQ/maOsjiYCg3SSQXJtd1aBwfpxQym8MT7lje/N7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773668629; c=relaxed/simple;
	bh=33EWCAnwOB6xKo+pw6RKCbvpx6CoHDnFTrTzayEwYk8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V2BsTKaBSL1WAxp23ziFi/Yqo+rSpVbGKbWbLQTjxMOyDpAsQm+vO9fm6pRJFPnZPV66ZvRPzJZUqGBkhwe9FrIauCl08tjl3/EhfGeIU/xoPjYRq/GnrpNKLSlfT3OF5JYAr47DhcBfSFx5ZNCoqhP10l/JLuI0ri5IvrnOVMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=jb8ZJO47; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id C3C9F240103
	for <linux-leds@vger.kernel.org>; Mon, 16 Mar 2026 14:43:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1773668625; bh=33EWCAnwOB6xKo+pw6RKCbvpx6CoHDnFTrTzayEwYk8=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=jb8ZJO47ps0mLZ7GSqxJ47Cq7KK4s306/jVdGpM/yeyu5sjcp4U/HLYoBz1VA/XjC
	 nY5t2uP2KtrdPopJ3LRQSguhTgBLqNRm1XfMmMzr5gjy4yJyJumMsnN/z8GhkQ3qSy
	 PJ6I6OLkCQE25OPq25tFXRU/o6gv8GwWXUvt4gW3kLd5mALOURQOdr9nv87pqCzNhH
	 e+8PjnHfWEMbACtWyGOrDdGTukPzDnhrRs0b1bzzF2vs8fX31bgfyj0EzklIZlMhh0
	 zpkaIMpBF+aj0cszEsM6ILKQ2WW5vLr01vKAP04x8sq8AfbNbBmD7iHCCQHDpnz3DF
	 QN2JatI0kSolA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fZGWw0cHkz6tvk;
	Mon, 16 Mar 2026 14:43:40 +0100 (CET)
Message-ID: <a4fb56d5eea790b51aa3623044e5d774a6bab47f.camel@posteo.de>
Subject: Re: [PATCH v3 7/7] leds: add synology microp led driver
From: Markus Probst <markus.probst@posteo.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich
	 <dakr@kernel.org>
Cc: Markus Probst via B4 Relay <devnull+markus.probst.posteo.de@kernel.org>,
  Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Miguel
 Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo	
 <gary@garyguo.net>, =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron	
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg	 <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross	 <tmgross@umich.edu>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Igor Korotin	 <igor.korotin.linux@gmail.com>, Daniel Almeida
 <daniel.almeida@collabora.com>,  Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Pavel
 Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, Robert Moore
 <robert.moore@intel.com>, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	rust-for-linux@vger.kernel.org,
 driver-core@lists.linux.dev, 	linux-pci@vger.kernel.org,
 linux-leds@vger.kernel.org, 	linux-acpi@vger.kernel.org,
 acpica-devel@lists.linux.dev
Date: Mon, 16 Mar 2026 13:43:44 +0000
In-Reply-To: <2026031645-unplowed-purist-9c4b@gregkh>
References: <20260313-synology_microp_initial-v3-0-ad6ac463a201@posteo.de>
	 <20260313-synology_microp_initial-v3-7-ad6ac463a201@posteo.de>
	 <DH1YH0GO75H8.18YSW2VMKRB3C@kernel.org>
	 <39f1c9bb0dbde9f1b60785f8e838289c888ffdb0.camel@posteo.de>
	 <DH3KAWWLECYW.3VBH7PIE7ZE20@kernel.org>
	 <eb2f7498c5f3247265effc47b3445a04ac71956e.camel@posteo.de>
	 <DH3M1023PCBI.1HYYZU93NS1JX@kernel.org>
	 <2026031645-unplowed-purist-9c4b@gregkh>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-+sZKitfK3M04UKxrVQbo"
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[posteo.de,none];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,collabora.com,intel.com,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-7365-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[posteo.de:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[markus.probst@posteo.de,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,markus.probst.posteo.de,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,posteo.de:dkim,posteo.de:mid]
X-Rspamd-Queue-Id: D7B0E29AADA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-+sZKitfK3M04UKxrVQbo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-03-16 at 07:33 +0100, Greg Kroah-Hartman wrote:
> On Sun, Mar 15, 2026 at 08:41:06PM +0100, Danilo Krummrich wrote:
> > I.e. if we can't (easily) use mfd cells and would need a custom API, th=
en why
> > even split it up at all, given that splitting it up would probably the =
most
> > complicated part of the whole driver.
> >=20
> > Greg, what do you think?
>=20
> I think this has yet to be proven to be a kernel driver at all at this
> point, and not just a userspace daemon that listens to the serial port
> and then does what is needed from there :)
>=20
> Or, if someone can prove that the operations on this serial data stream
> actually do require it to be in the kernel (which I have yet to see a
> list of what this connection does, did I miss it?) then a single driver,
> under the drivers/platform section of the kernel tree makes sense.
The sysoff component is strictly necessary for poweroff and reboot.

On ARM64 Synology NAS devices it is needed so the device actually
powers off after calling
`syscall(SYS_reboot, LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2,
LINUX_REBOOT_CMD_POWER_OFF, NULL);`
. Otherwise it would stay on.
Same applies to reboot.

On x86 it isn't clearly documented what sending the poweroff and reboot
command to the microp device exactly does, so this is based on
observations. It should be sent before issuing a poweroff or reboot via
ACPI Sleep. On reboot it resets various device states, so fan speeds go
to default, leds turn off etc., so it behaves like a coldboot.
On poweroff it will mark it as graceful shutdown (i. e. the device
won't turn automatically on, because it thinks a power-loss happend).

For the other components:
- leds
- hwmon
- input

It could theoratically be implemented in userspace. A userspace daemon
could theoratically control the fan speeds directly, issue a systemd
shutdown on power button press, control the leds directly etc.

But honestly, I don't understand why this is an argument.
With that argument drivers/leds, drivers/hwmon and drivers/input would
not even exist, because everything could be implemented in userspace
via
- I2C: /dev/i2c-* (drivers/i2c/i2c-dev.c)
- MMIO: /dev/ioport and /dev/mem (drivers/char/mem.c)
- GPIO: /sys/class/gpio (drivers/gpio/gpiolib-sysfs.c)
- SPI: /dev/spidev* (drivers/spi/spidev.c)
- PCI: /sys/class/pci_bus/ (drivers/pci/pci-sysfs.c)
- Serial: /dev/ttyS*
and likely almost any other bus device too.

Generally speaking, the kernel and its drivers is the layer between
hardware and software. It provides the hardware abstractions as
userspace interfaces. So any software on the same cpu architecture can
work with any hardware, as long as there is a kernel driver.

In the case of this driver, it means
- *any* led daemon can control the leds
- *any* fan control daemon can control the fan speed and frequency
- *any* monitoring software can view the provided sensors
- *any* init system can react to the power button
- *any* process can request a reboot or shutdown
.
I think this is the expected behaviour.

Thanks
- Markus Probst

>=20
> thanks,
>=20
> greg k-h

--=-+sZKitfK3M04UKxrVQbo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmm4CPobFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJEDR2H/jnrUPS2FYQAJbEWn2H8OkHzf+2BJpI
pQZhD0WOg3sDWU3oXYUoPQF+HXYeiTf7FMo6MJZpOaH2m+CPlToM3k9isyqsUdb0
gK6fpgcTZFJNG7jtbw88I/kGDx9Av5ulGhQqCvqHCnqjX38jE7LmHT7O2QC6GFwf
p4x0ZjEBFmDLLxilBbKvyq3UMX4qCWPXOf4mLPsPRECG3a4c0v7If1zI/7VXaOZL
npwZNm5KhWVHxBURJlmsYwLSEiJeOSqc4DYMRJiccpzFMAxCFIWHZ8htO99BtUOo
pL8NLR9sKs1pBYGZ8B5kZ3sZWlGp7vNMLU3hD3q/LLVHi2SUN1en2ksRnN083nYy
AO43hL9hb0jBEW2D5wXWahy/GSPZu3fQcRda5ztdCn8ZQg4tRwPczB3td+RitdAW
h4zqc0gk9+O0RxtCSssTs9ekByTGFEJgeCKGiOBZ+gSp9B9zeTWqEkt78L/JM38Q
KmiKZ57jUdRqnF0eQewj3/2TQ3M9P+PNay3uJ4eG3U+Hl/ULHD/40F24Abgo6cdq
0PVAUInTgXsVjYFyeE5E5JFw6Ehn6pJPSHVRimZRSR88/AKLqTOgdRleGm/aU7D4
9rNuaWQAUmH80clONCey6pJm3hwi93Wj7ybd2y5E3Hs6LkGu7p79hcqQ7l0kL3HA
CT9lZKm9jbdEWf7vvaW3UYm8
=rU/e
-----END PGP SIGNATURE-----

--=-+sZKitfK3M04UKxrVQbo--

