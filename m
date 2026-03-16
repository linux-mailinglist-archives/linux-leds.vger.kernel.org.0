Return-Path: <linux-leds+bounces-7368-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cL7VBalGuGmLbAEAu9opvQ
	(envelope-from <linux-leds+bounces-7368-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 16 Mar 2026 19:06:33 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9C729ECEC
	for <lists+linux-leds@lfdr.de>; Mon, 16 Mar 2026 19:06:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1FF69301BDC9
	for <lists+linux-leds@lfdr.de>; Mon, 16 Mar 2026 18:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28647340D90;
	Mon, 16 Mar 2026 18:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="qO6Lk7rT"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F4B33F8DC
	for <linux-leds@vger.kernel.org>; Mon, 16 Mar 2026 18:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773684389; cv=none; b=XwaefqB6VZpVkNHxeZY7zOPx6CAUgCwsA4lLX/HwoP4QLsGCafYSWPsjUjPqId6tH6naxA8qYq8+wtKTurlxo91n/tLr4ADRqIZR9Cx3iBsn4J7Yz7m/ejcugyS9v8MZcK0y7m2DJ8Z4z1bLOs+wOonO3IyxQnBQ39lVUd6pzjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773684389; c=relaxed/simple;
	bh=vsCerXvNI66p0WQN4f2HWtkZDjbz/hrQ/GAa3UbU95M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UftTcF/P8e1D6Dho68IQRd26iVwhY1Fibsj77V8VvaK6DYy4dCaYh3uKGjkXp5daKggstPZO9esZN/9jFMupmHDYAx2so5lQUuVxKWzB/uICBDyzKB8ttrjMm8dLTf+uSHuie5nt+CNKDPuZZO92LQGrSC3AvQfZTi1eyF4/rDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=qO6Lk7rT; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 4842D24002B
	for <linux-leds@vger.kernel.org>; Mon, 16 Mar 2026 19:06:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1773684385; bh=w4aMMeXH0b7JgTSQ3j7crI/pRlF2UNUuOM0hPyY2020=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=qO6Lk7rTUW3H0fPPJfL0YGhRHR1XTS90SrfRDYE8pBk9gt5ZhKNsQAfy69KXzCiao
	 pjGRF3NZJtST7bhPpXSAMH/DrAAvN1ENGG+ZNaaGay7YhOoKiODycXsj6QWCqG2yRa
	 dSkp3WxoDzxayQaYAEe362SdqM2jxkoD5sxPxIKzlD9QwZtGB6XxK/3yQz0o7OS975
	 r2fFLZ1DvGEli+vPgFyP/m+GQwIBDjYIWpY+p8Z6G3IKZTJaxBq+AIoWoNzua6OdDc
	 blIqYZ7il8b7kff3JP3SQ5CH8dNeALlsb4bUa7Xt+AniyB/FVn66MRVd3HE5JMBA0g
	 miEXkT04RIr6Q==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fZNM142Ltz9rxF;
	Mon, 16 Mar 2026 19:06:21 +0100 (CET)
Message-ID: <3ca65f7d0b00c93c91563bc29198f18d5a30eeae.camel@posteo.de>
Subject: Re: [PATCH v3 7/7] leds: add synology microp led driver
From: Markus Probst <markus.probst@posteo.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Markus Probst via B4 Relay	
 <devnull+markus.probst.posteo.de@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,  Miguel Ojeda <ojeda@kernel.org>, Boqun
 Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron	 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Andreas Hindborg	 <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross	 <tmgross@umich.edu>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Igor Korotin	
 <igor.korotin.linux@gmail.com>, Daniel Almeida
 <daniel.almeida@collabora.com>,  Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Pavel
 Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, Robert Moore
 <robert.moore@intel.com>, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	rust-for-linux@vger.kernel.org,
 driver-core@lists.linux.dev, 	linux-pci@vger.kernel.org,
 linux-leds@vger.kernel.org, 	linux-acpi@vger.kernel.org,
 acpica-devel@lists.linux.dev
Date: Mon, 16 Mar 2026 18:06:23 +0000
In-Reply-To: <2026031602-drove-timothy-1bb1@gregkh>
References: <20260313-synology_microp_initial-v3-0-ad6ac463a201@posteo.de>
	 <20260313-synology_microp_initial-v3-7-ad6ac463a201@posteo.de>
	 <DH1YH0GO75H8.18YSW2VMKRB3C@kernel.org>
	 <39f1c9bb0dbde9f1b60785f8e838289c888ffdb0.camel@posteo.de>
	 <DH3KAWWLECYW.3VBH7PIE7ZE20@kernel.org>
	 <eb2f7498c5f3247265effc47b3445a04ac71956e.camel@posteo.de>
	 <DH3M1023PCBI.1HYYZU93NS1JX@kernel.org>
	 <2026031645-unplowed-purist-9c4b@gregkh>
	 <a4fb56d5eea790b51aa3623044e5d774a6bab47f.camel@posteo.de>
	 <2026031602-drove-timothy-1bb1@gregkh>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-akERDsl+g92JaDyAMR+U"
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,collabora.com,intel.com,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-7368-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[posteo.de:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AA9C729ECEC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-akERDsl+g92JaDyAMR+U
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-03-16 at 14:58 +0100, Greg Kroah-Hartman wrote:
> On Mon, Mar 16, 2026 at 01:43:44PM +0000, Markus Probst wrote:
> > On Mon, 2026-03-16 at 07:33 +0100, Greg Kroah-Hartman wrote:
> > > On Sun, Mar 15, 2026 at 08:41:06PM +0100, Danilo Krummrich wrote:
> > > > I.e. if we can't (easily) use mfd cells and would need a custom API=
, then why
> > > > even split it up at all, given that splitting it up would probably =
the most
> > > > complicated part of the whole driver.
> > > >=20
> > > > Greg, what do you think?
> > >=20
> > > I think this has yet to be proven to be a kernel driver at all at thi=
s
> > > point, and not just a userspace daemon that listens to the serial por=
t
> > > and then does what is needed from there :)
> > >=20
> > > Or, if someone can prove that the operations on this serial data stre=
am
> > > actually do require it to be in the kernel (which I have yet to see a
> > > list of what this connection does, did I miss it?) then a single driv=
er,
> > > under the drivers/platform section of the kernel tree makes sense.
> > The sysoff component is strictly necessary for poweroff and reboot.
> >=20
> > On ARM64 Synology NAS devices it is needed so the device actually
> > powers off after calling
> > `syscall(SYS_reboot, LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2,
> > LINUX_REBOOT_CMD_POWER_OFF, NULL);`
> > . Otherwise it would stay on.
> > Same applies to reboot.
>=20
> So that means a write of a set of bytes to the serial port will cause
> the machine to reboot or shutdown?
Yes.
>=20
> > On x86 it isn't clearly documented what sending the poweroff and reboot
> > command to the microp device exactly does, so this is based on
> > observations. It should be sent before issuing a poweroff or reboot via
> > ACPI Sleep. On reboot it resets various device states, so fan speeds go
> > to default, leds turn off etc., so it behaves like a coldboot.
> > On poweroff it will mark it as graceful shutdown (i. e. the device
> > won't turn automatically on, because it thinks a power-loss happend).
> >=20
> > For the other components:
> > - leds
> > - hwmon
> > - input
>=20
> For "input" what exactly does the input device show up as?  A power
> button?  Something else?

Well there are a few other things besides a power button:

- beeper (short and long variant)
- factory reset button
- "USB Copy" button. Not present on all devices (including not present
on my testing device). It is meant for copying data from or to a usb
stick.

Both of these buttons don't have a keycode in include/uapi/linux/input-
event-codes.h, which is suprising given how many devices have a factory
reset button. So I am not sure if I can handle them in this driver.

=46rom what I can tell, there isn't actually a input device type I could
specify on registering a input device. But it would be considered a
misc input device.

>=20
> For hwmon, that makes sense to have a kernel driver.
>=20
> For leds, that depends on what you want to do with the led, as in the
> end you are just controlling it from userspace anyway :)


>=20
> > It could theoratically be implemented in userspace. A userspace daemon
> > could theoratically control the fan speeds directly, issue a systemd
> > shutdown on power button press, control the leds directly etc.
> >=20
> > But honestly, I don't understand why this is an argument.
> > With that argument drivers/leds, drivers/hwmon and drivers/input would
> > not even exist, because everything could be implemented in userspace
> > via
> > - I2C: /dev/i2c-* (drivers/i2c/i2c-dev.c)
> > - MMIO: /dev/ioport and /dev/mem (drivers/char/mem.c)
> > - GPIO: /sys/class/gpio (drivers/gpio/gpiolib-sysfs.c)
> > - SPI: /dev/spidev* (drivers/spi/spidev.c)
> > - PCI: /sys/class/pci_bus/ (drivers/pci/pci-sysfs.c)
> > - Serial: /dev/ttyS*
> > and likely almost any other bus device too.
> >=20
> > Generally speaking, the kernel and its drivers is the layer between
> > hardware and software. It provides the hardware abstractions as
> > userspace interfaces. So any software on the same cpu architecture can
> > work with any hardware, as long as there is a kernel driver.
>=20
> Yes, I kind of know what drivers and classes do and why they are needed,
> that's not the point here. :)
>=20
> > In the case of this driver, it means
> > - *any* led daemon can control the leds
> > - *any* fan control daemon can control the fan speed and frequency
> > - *any* monitoring software can view the provided sensors
> > - *any* init system can react to the power button
> > - *any* process can request a reboot or shutdown
> > .
> > I think this is the expected behaviour.
>=20
> Ok great, then make a single driver that handles all of this, like other
> drivers/platform/ drivers do today, and all should be fine.
Great, I will.

Thanks
- Markus Probst

>=20
> thanks,
>=20
> greg k-h

--=-akERDsl+g92JaDyAMR+U
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmm4RoobFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJEDR2H/jnrUPSsUIQAJeCzIeF7FxfVLPKwAJv
sYO9ZXh6FWfGwq+zzAzAXqlhJQWtoptqBFhmWtrGiAEUYFDMlEG2jO9t4zE9cQiR
O+QVCX1qWxERY0X4gbrT0GEcHuZpB7eqDRpHqQ1edsZrrbjD0LJl2GwrR+juH3p+
J0H6qYNP0BP5I2Ox7pt3Wjw942RE8yV99ReJX15i7IseMtToK170J0yfLhV9EYdD
ti/CzYvzqLndEhHRCVDrJhqRkUY7ffDrb/xir2FRqRmEnMw8Tyyy05eBccafoX4K
bhb+cld/DtCZYR2BL2wyj6PVV6EYOjInchNDRa9T1txQ/yAd/s0yx2znesXtj2Kt
xGn4A82oT4q84JtGyz4SCTvhAFMtle+23zmYHGgsJGjWLV2rAFLrTplZErqZWtCo
UYNRzDvzksVnGSp05DeVmM1qZp8PZtfG/UlIfEYCbkkQVT8LZVb6/2BAzGdbmjMk
LBI9lI95d17uCyxp9+1Pb1fls+XD25b0v1Qv6U5/YJPAwbyGAW3JtGsVhb0vhpdI
hxTeJKlM1qq9voRoRWSDq+CSYGbNtQCvpjderejTY5otR9Ip1h+HAhTa8326QFmp
OxOfwBf0ZcvmnxG4bIHDiySMdXLMSNzgAyGlZfcfI0rhEWazQktxJncKWn7D7VWP
ojdLA9L7y+sXPTSIujFHYCZA
=q1ya
-----END PGP SIGNATURE-----

--=-akERDsl+g92JaDyAMR+U--

