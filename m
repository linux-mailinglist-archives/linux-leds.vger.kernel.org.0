Return-Path: <linux-leds+bounces-7366-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIgzG4oMuGkWYQEAu9opvQ
	(envelope-from <linux-leds+bounces-7366-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 16 Mar 2026 14:58:34 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAD429AE31
	for <lists+linux-leds@lfdr.de>; Mon, 16 Mar 2026 14:58:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 62AB030086B7
	for <lists+linux-leds@lfdr.de>; Mon, 16 Mar 2026 13:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70B8D39A7F3;
	Mon, 16 Mar 2026 13:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="M9ic3BVM"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32788382F39;
	Mon, 16 Mar 2026 13:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773669507; cv=none; b=grGjnNcJJ4+7hWWGJdd8XHZNfqt/eVOfe04CsU0Ra0aRbjjoJkvvmzYfAGOa6RUFKS6xKG30e+7uaOQABRrklfluyXGew9gHodiB0PBJu/KF0d64kqFyLdTqNmRLrpzRWxwzvkYc1rGgGvo4PYdSWSnluI5MlAGGsNTBKKBxdLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773669507; c=relaxed/simple;
	bh=O3/GG12QpLO1UZgLug9usf1QzvRky6kw6Ji7zydi8gU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pxHcr6ff0dRpHFatiIcI+lygZNPilXUJeSBqkVjIrmqUI9R65E3tWJMiepdjIHpk1i3QVi1PXvVsf9FiRed2Vd35GvZ+iCM5j8vfUwwHAjoOnqPpSSIQI/tKFFqfa3AvfgdgJMJbYF4ExKrciZyXvV/XJ9mHMhkkbgs8YBK+ark=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=M9ic3BVM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 287BEC19421;
	Mon, 16 Mar 2026 13:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773669506;
	bh=O3/GG12QpLO1UZgLug9usf1QzvRky6kw6Ji7zydi8gU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M9ic3BVMtkejqZnGD/X589zYsSaNYNIFpqWnXN0K4rpu7xcbEijzAZQIM+9JkB07p
	 FZhGw4+v3ETjruTkeo0JTZ+b2KgEKnWha59HpfOZVifCFy5SNauZ4Ca5zauENxZJnR
	 YBnRNIrwc4MpPqEfMsi3FJg901LsmKffMc4UrwQc=
Date: Mon, 16 Mar 2026 14:58:22 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Markus Probst <markus.probst@posteo.de>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Markus Probst via B4 Relay <devnull+markus.probst.posteo.de@kernel.org>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Igor Korotin <igor.korotin.linux@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
	Robert Moore <robert.moore@intel.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	driver-core@lists.linux.dev, linux-pci@vger.kernel.org,
	linux-leds@vger.kernel.org, linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: Re: [PATCH v3 7/7] leds: add synology microp led driver
Message-ID: <2026031602-drove-timothy-1bb1@gregkh>
References: <20260313-synology_microp_initial-v3-0-ad6ac463a201@posteo.de>
 <20260313-synology_microp_initial-v3-7-ad6ac463a201@posteo.de>
 <DH1YH0GO75H8.18YSW2VMKRB3C@kernel.org>
 <39f1c9bb0dbde9f1b60785f8e838289c888ffdb0.camel@posteo.de>
 <DH3KAWWLECYW.3VBH7PIE7ZE20@kernel.org>
 <eb2f7498c5f3247265effc47b3445a04ac71956e.camel@posteo.de>
 <DH3M1023PCBI.1HYYZU93NS1JX@kernel.org>
 <2026031645-unplowed-purist-9c4b@gregkh>
 <a4fb56d5eea790b51aa3623044e5d774a6bab47f.camel@posteo.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4fb56d5eea790b51aa3623044e5d774a6bab47f.camel@posteo.de>
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7366-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,collabora.com,intel.com,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-leds,markus.probst.posteo.de,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4FAD429AE31
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 01:43:44PM +0000, Markus Probst wrote:
> On Mon, 2026-03-16 at 07:33 +0100, Greg Kroah-Hartman wrote:
> > On Sun, Mar 15, 2026 at 08:41:06PM +0100, Danilo Krummrich wrote:
> > > I.e. if we can't (easily) use mfd cells and would need a custom API, then why
> > > even split it up at all, given that splitting it up would probably the most
> > > complicated part of the whole driver.
> > > 
> > > Greg, what do you think?
> > 
> > I think this has yet to be proven to be a kernel driver at all at this
> > point, and not just a userspace daemon that listens to the serial port
> > and then does what is needed from there :)
> > 
> > Or, if someone can prove that the operations on this serial data stream
> > actually do require it to be in the kernel (which I have yet to see a
> > list of what this connection does, did I miss it?) then a single driver,
> > under the drivers/platform section of the kernel tree makes sense.
> The sysoff component is strictly necessary for poweroff and reboot.
> 
> On ARM64 Synology NAS devices it is needed so the device actually
> powers off after calling
> `syscall(SYS_reboot, LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2,
> LINUX_REBOOT_CMD_POWER_OFF, NULL);`
> . Otherwise it would stay on.
> Same applies to reboot.

So that means a write of a set of bytes to the serial port will cause
the machine to reboot or shutdown?

> On x86 it isn't clearly documented what sending the poweroff and reboot
> command to the microp device exactly does, so this is based on
> observations. It should be sent before issuing a poweroff or reboot via
> ACPI Sleep. On reboot it resets various device states, so fan speeds go
> to default, leds turn off etc., so it behaves like a coldboot.
> On poweroff it will mark it as graceful shutdown (i. e. the device
> won't turn automatically on, because it thinks a power-loss happend).
> 
> For the other components:
> - leds
> - hwmon
> - input

For "input" what exactly does the input device show up as?  A power
button?  Something else?

For hwmon, that makes sense to have a kernel driver.

For leds, that depends on what you want to do with the led, as in the
end you are just controlling it from userspace anyway :)

> It could theoratically be implemented in userspace. A userspace daemon
> could theoratically control the fan speeds directly, issue a systemd
> shutdown on power button press, control the leds directly etc.
> 
> But honestly, I don't understand why this is an argument.
> With that argument drivers/leds, drivers/hwmon and drivers/input would
> not even exist, because everything could be implemented in userspace
> via
> - I2C: /dev/i2c-* (drivers/i2c/i2c-dev.c)
> - MMIO: /dev/ioport and /dev/mem (drivers/char/mem.c)
> - GPIO: /sys/class/gpio (drivers/gpio/gpiolib-sysfs.c)
> - SPI: /dev/spidev* (drivers/spi/spidev.c)
> - PCI: /sys/class/pci_bus/ (drivers/pci/pci-sysfs.c)
> - Serial: /dev/ttyS*
> and likely almost any other bus device too.
> 
> Generally speaking, the kernel and its drivers is the layer between
> hardware and software. It provides the hardware abstractions as
> userspace interfaces. So any software on the same cpu architecture can
> work with any hardware, as long as there is a kernel driver.

Yes, I kind of know what drivers and classes do and why they are needed,
that's not the point here. :)

> In the case of this driver, it means
> - *any* led daemon can control the leds
> - *any* fan control daemon can control the fan speed and frequency
> - *any* monitoring software can view the provided sensors
> - *any* init system can react to the power button
> - *any* process can request a reboot or shutdown
> .
> I think this is the expected behaviour.

Ok great, then make a single driver that handles all of this, like other
drivers/platform/ drivers do today, and all should be fine.

thanks,

greg k-h

