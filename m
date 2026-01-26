Return-Path: <linux-leds+bounces-6771-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCLHHnW6d2lGkgEAu9opvQ
	(envelope-from <linux-leds+bounces-6771-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 26 Jan 2026 20:03:17 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F36248C4E7
	for <lists+linux-leds@lfdr.de>; Mon, 26 Jan 2026 20:03:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F1E41301C6D7
	for <lists+linux-leds@lfdr.de>; Mon, 26 Jan 2026 19:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B003E271468;
	Mon, 26 Jan 2026 19:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TkB5ybek"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8865E26C3B0;
	Mon, 26 Jan 2026 19:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769454194; cv=none; b=NC9Iu4qHyUIP3IN+m9qTRVjI+oamFC6dvsdlRkR6Zwv19rylS9WeCv39HTWHeYR86lDwGmlzFh5+9Qsi2coNRkTsshOjYXyDhZK0zcdazlcV1J1SNi6IHtoYZCxUMT4gQi6n8Y2eL05z8IbbKn2NACiMSnhA/jyaaZGig+MojYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769454194; c=relaxed/simple;
	bh=N/WsB+lHMeUrnKNoJy/1g1XZHLjTsW0GrEvtmfQmX+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KOOUDexRkLCCDrZVn2TRkp14+N9weDf5NjDRgatBK1wB4wTVYV2CJR5KQd3ODy0kq/FffW6voVH0oWFXA9kq3ttfAY+DjUp6VQOkvc0uB6HgFahSCCqerTdjGrBMSohomJ8o3coIH6c7swj7hmpUYKLopx3BdBWffd0SPdRNCNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TkB5ybek; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 642B3C116C6;
	Mon, 26 Jan 2026 19:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769454194;
	bh=N/WsB+lHMeUrnKNoJy/1g1XZHLjTsW0GrEvtmfQmX+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TkB5ybekNqICpPvj6Qyif4arPpZZMMpUX1EpRKRgi3QtGe/sDPr79BuSAZHB7Ll8x
	 Js3strJf11DSVobT659M1nYrI45keisGlImOB4B1fpZ5QyooIq9A++BEXyYjDNtnXO
	 ouPIHvHoRTBYK3gnV2UjtIO2n09+Kl0AelF8J7WEgCfUW9uLQb2Rv5OESjcIHIhpPV
	 8ZQuzrIwfilyQ2jA41GNlC+5s+EwHonanG2XUncZ3GKCm0TAZybtBpu0/s1sawYX8a
	 zMU8K7txDpdkTRl3D9AhUrBf3DM7NDVpFrqm58nIPA6h/qK4LQvcd6zyvmiNjBFLe2
	 uGPaecP5MvQ/A==
Date: Mon, 26 Jan 2026 20:03:07 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Ian Pilcher <arequipeno@gmail.com>
Cc: Markus Probst <markus.probst@posteo.de>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	John Garry <john.g.garry@oracle.com>,
	Jason Yan <yanaijie@huawei.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH RFC 0/4] leds: extend disk trigger
Message-ID: <aXe6a7X6QZmEZHjI@ryzen>
References: <20260123-ledtrig_disk_-v1-0-07004756467b@posteo.de>
 <aXctPaaXFYemV20T@ryzen>
 <03a91568-d1a0-4779-a465-2788f4765a42@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03a91568-d1a0-4779-a465-2788f4765a42@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6771-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cassel@kernel.org,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[posteo.de,kernel.org,gmail.com,oracle.com,huawei.com,hansenpartnership.com,ucw.cz,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F36248C4E7
X-Rspamd-Action: no action

Hello Ian,

On Mon, Jan 26, 2026 at 10:19:07AM -0600, Ian Pilcher wrote:
> On 1/26/26 3:00 AM, Niklas Cassel wrote:
> > But I'm not a fan of making the driver more complex.
> > If we want something more complex than what is already there, then it
> > is probably much better handled in user space, considering the amount
> > of possible configuration options.
> > 
> > Basically the same argument as used in:
> > https://lore.kernel.org/linux-nvme/20220227234258.24619-1-ematsumiya@suse.de/T/#u
> 
> Niklas -
> 
> Can you provide some links on how this might be done in userspace?

See the link to the thread above.

Ming suggests "tracking iostat in a fixed period, and triggering one
led activity if any read/write IO happens during 0.5sec."

There is also a link to an nvme-led-daemon in the thread:
https://github.com/scarlion1/nvme-led-daemon

But considering that it is using:
https://www.kernel.org/doc/Documentation/block/stat.txt

I don't see why it can't be used for any block device.


Kind regards,
Niklas

