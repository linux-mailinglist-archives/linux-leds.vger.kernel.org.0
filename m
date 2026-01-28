Return-Path: <linux-leds+bounces-6777-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDuJFCSveWnayQEAu9opvQ
	(envelope-from <linux-leds+bounces-6777-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 28 Jan 2026 07:39:32 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEE89D78E
	for <lists+linux-leds@lfdr.de>; Wed, 28 Jan 2026 07:39:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 849B330177A7
	for <lists+linux-leds@lfdr.de>; Wed, 28 Jan 2026 06:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F9F4326953;
	Wed, 28 Jan 2026 06:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZJNgekUQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7793F221F1C;
	Wed, 28 Jan 2026 06:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769582346; cv=none; b=O/OPwhu4+mMSEf80LpZ9VvpMwRa1bb6g9gL43cGP50EPMIn5aLb/VRlHAzL+87BCuIwKI966WsFit+5F3AcilD6TrGvnrLrgkW84uXi+BK4kn3LltWyVTGsCbyIPvbrRxK6Z4UM8qeh9GMxZ0aw/kvarxWWnKHbj5Cv9T0Sk+j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769582346; c=relaxed/simple;
	bh=o/WtRBxzGHwSv6xQweCyJfYQx241NkL25tgSbj+LWRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W6sKR/1saHBCXm8lvBtozZMwUJf22xonNWqXb7BRfrLj1BPBgNokEpxN55+DQpsln57S8wGqOpwZG4xRVNdVdxo0T2jLBf7AK9JVia/wTjspiZxtGCxnfJS7ZCl/n80iAYgzN+/uBtzGnWPkgt5ne71BlhS+QkpNjlIY9tvwsC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZJNgekUQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0076C4CEF1;
	Wed, 28 Jan 2026 06:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769582346;
	bh=o/WtRBxzGHwSv6xQweCyJfYQx241NkL25tgSbj+LWRc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZJNgekUQnsvB5Y63llMBD5JJZOtW7c0LEj6L/nASW1Y/l88BAFCFyLgdWdgdxzfkb
	 lF8PpIlf9H+0S+bZd9l8QM3IhbPt2yy6a/rt2zWaEgGKxme39a60nGAbuHu13u/pc5
	 q6v4Ghe/VQgYUJiWsXUa6rFptA3a/OHWXHQyJLYpPMvV+MgdAiqLpfAzc9EPa67Qnw
	 0aL8hwhtE2x98JSlRKVijvXGjNyTj9rz13wScVXtdTQCDeWmkMt2j2cAtqbiNkx5W3
	 w/dDfZkm3ujgCbex1Vn9+sJ3Zdto0eJ4b/lhf6sOg3xoniqFVLFKuEkh4b6ZOYsPHb
	 m9w9wZd45FvMg==
Message-ID: <2382dee0-983f-4c69-af7b-a7a48cad23aa@kernel.org>
Date: Wed, 28 Jan 2026 15:34:05 +0900
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
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20f855baaa7c36010eab9997a2f43b4f62be726b.camel@posteo.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6777-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,oracle.com,huawei.com,hansenpartnership.com,ucw.cz,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlemoal@kernel.org,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,die.net:url]
X-Rspamd-Queue-Id: 9EEE89D78E
X-Rspamd-Action: no action

On 1/28/26 12:34 AM, Markus Probst wrote:
>> Having a user space implementation for your feature would also allow
>> an upstream kernel, without the need for any custom kernel patches.
> Only because it can be done in userspace, doesn't mean it should be.

Yes it should. Maintaining userspace is far easier than forcing kernel changes
onto users to get blinking LEDs. So unless you have a very strong argument for
doing it in the kernel, userspace is probably the right approach. That will
apply to any block device, and not just ATA devices. E.g. NAS with M.2 NVMe
storage can work with the same.

>> There seems to be existing user space applications that handles this,
>> I think both the daemon I linked to before, which uses /sys/block/<dev>/stat
>> which is thus per device and not per port, and e.g. this:
>> https://linux.die.net/man/8/ledmon
>> https://github.com/md-raid-utilities/ledmon
>> https://github.com/md-raid-utilities/ledmon/blob/main/src/lib/ahci.c
> As far as I can tell, this daemon doesn't actually use the LED
> Subsystem, but instead leds directly connected to the storage
> controller.
> But yes, I would be capable of coding such daemon.

Then let's try. That will allow checking if anything is missing in the kernel
interface to do that nicely.

>> I think my main concern is that I don't think we should bloat the kernel
>> for a complex feature that can just as well be implemented in user space.
> It is still unclear to me if you worry about the complexity in
> drivers/ata/libata-* or drivers/leds/trigger/ledtrig-disk.c

It is not so much about complexity but rather the fact that controlling
blinking LEDs in the hot IO path is not desirable. While SATA HDDs will be less
sensible to the delays caused by the calls to the LED control functions
compared to fast NVMe SSDs, we do also need to think about much faster SATA
SSDs. So instead of risking performance regressions, let's try to do this in
userspace first.


-- 
Damien Le Moal
Western Digital Research

