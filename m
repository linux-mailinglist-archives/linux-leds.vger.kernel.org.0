Return-Path: <linux-leds+bounces-6784-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id J+a/Fe7kemko/QEAu9opvQ
	(envelope-from <linux-leds+bounces-6784-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 29 Jan 2026 05:41:18 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC465ABB8F
	for <lists+linux-leds@lfdr.de>; Thu, 29 Jan 2026 05:41:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 473C9301476A
	for <lists+linux-leds@lfdr.de>; Thu, 29 Jan 2026 04:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D2402D0C99;
	Thu, 29 Jan 2026 04:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ICkOUpqn"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1645726E71F;
	Thu, 29 Jan 2026 04:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769661675; cv=none; b=bfVMo21yZplp2yEyXlcBRKM9yYc60u2y+KhySXL3lDpna+U1U0TMCB3qyj1RCBoh0Ek2dErctkgacv/eHNMUTHpJGltXFcU9i4uNGo3rN0PK/JXojQjP6sTjw53vq78792jTVBuGuZ2rsS62XTmtOfnCIJ+67wK9Pu0mk4R+txM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769661675; c=relaxed/simple;
	bh=gROWjWmyD7Nqp3cAvySmJU8PRCZMcKtAX74x9H8kGuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KmVXpo9/GCFHISkbQ1GUxUOUUgTDExhc+ZrQKoZEHJI5VsJYGu4XBiOTBZ35m+AU/lxHzK91lAyvabKcNTrzd6CGzEfD2xssEy9i6zeaB/oJnVqUhqmegXKNK2YjmZdHyoFMBDDa6Ktc1Oxvxfota9UoqbJFU58OjIn/EYmnNBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ICkOUpqn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7CAAC116D0;
	Thu, 29 Jan 2026 04:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769661674;
	bh=gROWjWmyD7Nqp3cAvySmJU8PRCZMcKtAX74x9H8kGuA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ICkOUpqn6bj8mPbjH6dzPbCIEiLLmTRtoGZX1UAB841E9xUZ7nn2H64sKhEX5B/9p
	 jkpsgVWgeoQ6/X24R5XDeYveTYQUkQkz7DAaUcLGQjcF6T4gyRjdvcubWlqfjqMQ0Q
	 +zszQx3lWJfFbOK7+XGW1xGvBwLrh9pY2BcMNrPoVpD2PdexL+kCphAo2V+cY+UGKl
	 8m+pTwrT24O3RXWdv15EbqR16sVxEhaWuP0xsi04FTqr2qtly1PCzxzn+SxNR9yGcm
	 1cVnwerlAzE4OZlq/Ucj1eBt37Bjn0u1OWQ30rg6aMrTE8+aDQ1oNIHT3sODuefx+H
	 ZSGkBcd/+EN9g==
Message-ID: <9e062635-f946-4a8b-862d-a38bfc50d6ce@kernel.org>
Date: Thu, 29 Jan 2026 13:41:10 +0900
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/4] leds: extend disk trigger
To: Markus Probst <markus.probst@posteo.de>, Niklas Cassel <cassel@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 John Garry <john.g.garry@oracle.com>, Jason Yan <yanaijie@huawei.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-scsi@vger.kernel.org,
 Ian Pilcher <arequipeno@gmail.com>
References: <20260123-ledtrig_disk_-v1-0-07004756467b@posteo.de>
 <aXctPaaXFYemV20T@ryzen>
 <ce454969b83dbb0e3bb4ea78f682603cc328ceb9.camel@posteo.de>
 <aXiGNZm12vLhQJ4Q@fedora>
 <20f855baaa7c36010eab9997a2f43b4f62be726b.camel@posteo.de>
 <2382dee0-983f-4c69-af7b-a7a48cad23aa@kernel.org>
 <c34fb5404e7033fe719b0072ea8a87a1caa2bf80.camel@posteo.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <c34fb5404e7033fe719b0072ea8a87a1caa2bf80.camel@posteo.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6784-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,oracle.com,huawei.com,hansenpartnership.com,ucw.cz,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlemoal@kernel.org,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BC465ABB8F
X-Rspamd-Action: no action

On 1/29/26 00:44, Markus Probst wrote:
>> That will allow checking if anything is missing in the kernel
>> interface to do that nicely.
> There is.
> 
> I noticed for leds, that the fwnode path isn't exposed in sysfs.
> "/sys/class/leds/<name>/device/firmware_node/path" exists, but points
> to the parent device.
> 
> Something similar with scsi and ata exists. scsi doesn't expose the
> firmware_node and there is no symlink (or other connection that I am
> ware of) between scsi_* and ata_* in sysfs. This means, I cannot map a
> fwnode path to a block device.
> 
> If I want to distribute a pre-defined config for such led userspace
> daemon alongside the ACPI Overlay for a specific NAS model, I need an
> identifier that is equal across all devices with that specific NAS
> model.
> 
> This is less of an issue for leds, but given that leds could be renamed
> on name collisions the issue still exists.

All of this is not the hot path, so we can work on it.

If new sysfs device attributes for an ATA device, you can add them to
ata_ncq_sdev_attrs in libata-sata.c. These show up as part of the scsi device
attributes, so if you define this well with the scsi side, the same attribute
names can be used for pure scsi devices and ATA devices served with libata.


-- 
Damien Le Moal
Western Digital Research

