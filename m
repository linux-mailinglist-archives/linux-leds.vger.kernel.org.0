Return-Path: <linux-leds+bounces-6783-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULeWEeeEemnx7AEAu9opvQ
	(envelope-from <linux-leds+bounces-6783-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 28 Jan 2026 22:51:35 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A22A93E2
	for <lists+linux-leds@lfdr.de>; Wed, 28 Jan 2026 22:51:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6299D30107E2
	for <lists+linux-leds@lfdr.de>; Wed, 28 Jan 2026 21:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FF91329C57;
	Wed, 28 Jan 2026 21:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ypu8e0xL"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A04D31C57B;
	Wed, 28 Jan 2026 21:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769637092; cv=none; b=p0z2t0gp7EkezG7fkWBdozMLCvPiE8b04l+FLvNElYu13R6Nh//JTYMeMkP8va8QrUYnEplrPsSlz9NRxAVEss2j6MuBNfdTTYPaxeNfZ3rIOsmAbP7e6HvniirJh0siRdY3qu8ecfvYBMLQg0rEP+Ulsd0nq/7drllnvESk2FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769637092; c=relaxed/simple;
	bh=jd/m6ATiT++9/cH2mRhstNtAGJEDjd8OgcmOnu0mXWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qYbUfrXsxyShlepV7Gqc6OkbhSsSZ3bBiW3bB2dF9CZCjfJPqwNvYKueoy+TMy/babpq2dcQ5UaVKQJMi0w991dyv79BSEim2MXPCVGnmx+NY7VlmqfdBGzc6yj+UCdIz3iBfubsKxzCZsQXeyDqjWM7sN8DLAZBJnFXvrX4mak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ypu8e0xL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E5FAC4CEF1;
	Wed, 28 Jan 2026 21:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769637092;
	bh=jd/m6ATiT++9/cH2mRhstNtAGJEDjd8OgcmOnu0mXWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ypu8e0xLeAzQkaVnrXua7G8E9oF19JxmuoWyy/ov1c6he9+meQuexyqRkGxb3bHR2
	 FcwTZCNPXBqzlxnAAohWG4TDQIauXUGSOIPPh8iWWgTsBUA/uvsvt3Qs20ac7pPSqh
	 0L8HxqHmE1/PsqHSdMug5NP/WHBVUl1cdMgicrUM6s/BYSGlBvs4KsDDnDmHNgEaPC
	 ROgHlm+Zh9EFdBS4kBfqv78oEN57nXVCiYKozOftp5/8+hsR1DzDBZ6ufIpMSyZZol
	 sk0Bg2FovzUMLzz9NJMrftq6KvisfNhQf0aG7us3jRlani3euJRjxMXUfsaAhLdLYo
	 fs+0VPxAsCDrQ==
Date: Wed, 28 Jan 2026 22:51:26 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Markus Probst <markus.probst@posteo.de>
Cc: Damien Le Moal <dlemoal@kernel.org>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	John Garry <john.g.garry@oracle.com>,
	Jason Yan <yanaijie@huawei.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-scsi@vger.kernel.org,
	Ian Pilcher <arequipeno@gmail.com>
Subject: Re: [PATCH RFC 0/4] leds: extend disk trigger
Message-ID: <aXqE3tn4ACa9HnwU@ryzen>
References: <20260123-ledtrig_disk_-v1-0-07004756467b@posteo.de>
 <aXctPaaXFYemV20T@ryzen>
 <ce454969b83dbb0e3bb4ea78f682603cc328ceb9.camel@posteo.de>
 <aXiGNZm12vLhQJ4Q@fedora>
 <20f855baaa7c36010eab9997a2f43b4f62be726b.camel@posteo.de>
 <2382dee0-983f-4c69-af7b-a7a48cad23aa@kernel.org>
 <c34fb5404e7033fe719b0072ea8a87a1caa2bf80.camel@posteo.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c34fb5404e7033fe719b0072ea8a87a1caa2bf80.camel@posteo.de>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6783-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,oracle.com,huawei.com,hansenpartnership.com,ucw.cz,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cassel@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A2A22A93E2
X-Rspamd-Action: no action

Hello Markus,

On Wed, Jan 28, 2026 at 03:44:19PM +0000, Markus Probst wrote:
> Something similar with scsi and ata exists. scsi doesn't expose the
> firmware_node and there is no symlink (or other connection that I am
> ware of) between scsi_* and ata_* in sysfs. This means, I cannot map a
> fwnode path to a block device.

Hopefully this might help you:

$ ls -al /sys/class/scsi_device | grep ata
lrwxrwxrwx.  1 root root 0 Jan 29 05:12 4:0:0:0 -> ../../devices/pci0000:00/0000:00:17.0/ata5/host4/target4:0:0/4:0:0:0/scsi_device/4:0:0:0
lrwxrwxrwx.  1 root root 0 Jan 29 05:12 5:0:0:0 -> ../../devices/pci0000:00/0000:00:17.0/ata6/host5/target5:0:0/5:0:0:0/scsi_device/5:0:0:0
lrwxrwxrwx.  1 root root 0 Jan 29 05:12 8:0:0:0 -> ../../devices/pci0000:00/0000:00:17.0/ata9/host8/target8:0:0/8:0:0:0/scsi_device/8:0:0:0
lrwxrwxrwx.  1 root root 0 Jan 29 05:12 9:0:0:0 -> ../../devices/pci0000:00/0000:00:17.0/ata10/host9/target9:0:0/9:0:0:0/scsi_device/9:0:0:0


For a specific device, e.g. 4:0:0:0:

$ realpath /sys/class/scsi_device/4:0:0:0/
/sys/devices/pci0000:00/0000:00:17.0/ata5/host4/target4:0:0/4:0:0:0/scsi_device/4:0:0:0

To get the block device name:
$ ls /sys/class/scsi_device/4:0:0:0/device/block/
sda

or

$ ls /sys/devices/pci0000:00/0000:00:17.0/ata5/host4/target4:0:0/4:0:0:0/scsi_device/4:0:0:0/device/block/
sda


You can parse the port from the path. The above example is port 5.

If using a port multiplier (PM), there can be multiple links/devices per port.


Otherwise, for SATA there should be only one.

$ ls -al /sys/class/ata_port/ata5/device/ | grep link | wc -l
1

$ ls -al /sys/class/ata_port/ata5/device/link5/dev5.0/firmware_node

or

$ ls -al  /sys/class/ata_device/dev5.*/device/firmware_node



For PCI BDF, you can use /dev/disk/by-path/

$ ls -al /dev/disk/by-path/ | grep ata
lrwxrwxrwx.  1 root root   9 Jan 29 05:11 pci-0000:00:17.0-ata-3 -> ../../sda
lrwxrwxrwx.  1 root root   9 Jan 29 05:11 pci-0000:00:17.0-ata-3.0 -> ../../sda
lrwxrwxrwx.  1 root root   9 Jan 29 05:11 pci-0000:00:17.0-ata-4 -> ../../sdb
lrwxrwxrwx.  1 root root   9 Jan 29 05:11 pci-0000:00:17.0-ata-4.0 -> ../../sdb
lrwxrwxrwx.  1 root root   9 Jan 29 05:11 pci-0000:00:17.0-ata-7 -> ../../sdc
lrwxrwxrwx.  1 root root   9 Jan 29 05:11 pci-0000:00:17.0-ata-7.0 -> ../../sdc
lrwxrwxrwx.  1 root root   9 Jan 29 05:11 pci-0000:00:17.0-ata-8 -> ../../sdd
lrwxrwxrwx.  1 root root   9 Jan 29 05:11 pci-0000:00:17.0-ata-8.0 -> ../../sdd

Note that these suffixes do not correlate to the ata port number in /sys/class/ata_*


$ ls -al /sys/class/ata_port/
total 0
drwxr-xr-x.  2 root root 0 Jan 29 05:11 .
drwxr-xr-x. 84 root root 0 Jan 29 05:12 ..
lrwxrwxrwx.  1 root root 0 Nov 19 04:01 ata1 -> ../../devices/pci0000:00/0000:00:11.5/ata1/ata_port/ata1
lrwxrwxrwx.  1 root root 0 Jan 29 05:26 ata10 -> ../../devices/pci0000:00/0000:00:17.0/ata10/ata_port/ata10
lrwxrwxrwx.  1 root root 0 Nov 19 04:01 ata11 -> ../../devices/pci0000:50/0000:50:02.0/0000:51:00.0/ata11/ata_port/ata11
lrwxrwxrwx.  1 root root 0 Nov 19 04:01 ata12 -> ../../devices/pci0000:50/0000:50:02.0/0000:51:00.0/ata12/ata_port/ata12
lrwxrwxrwx.  1 root root 0 Nov 19 04:01 ata13 -> ../../devices/pci0000:50/0000:50:02.0/0000:51:00.0/ata13/ata_port/ata13
lrwxrwxrwx.  1 root root 0 Nov 19 04:01 ata2 -> ../../devices/pci0000:00/0000:00:11.5/ata2/ata_port/ata2
lrwxrwxrwx.  1 root root 0 Jan 29 05:26 ata3 -> ../../devices/pci0000:00/0000:00:17.0/ata3/ata_port/ata3
lrwxrwxrwx.  1 root root 0 Jan 29 05:26 ata4 -> ../../devices/pci0000:00/0000:00:17.0/ata4/ata_port/ata4
lrwxrwxrwx.  1 root root 0 Jan 29 05:26 ata5 -> ../../devices/pci0000:00/0000:00:17.0/ata5/ata_port/ata5
lrwxrwxrwx.  1 root root 0 Jan 29 05:26 ata6 -> ../../devices/pci0000:00/0000:00:17.0/ata6/ata_port/ata6
lrwxrwxrwx.  1 root root 0 Jan 29 05:26 ata7 -> ../../devices/pci0000:00/0000:00:17.0/ata7/ata_port/ata7
lrwxrwxrwx.  1 root root 0 Jan 29 05:26 ata8 -> ../../devices/pci0000:00/0000:00:17.0/ata8/ata_port/ata8
lrwxrwxrwx.  1 root root 0 Jan 29 05:26 ata9 -> ../../devices/pci0000:00/0000:00:17.0/ata9/ata_port/ata9


Kind regards,
Niklas

