Return-Path: <linux-leds+bounces-6699-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAjYM38acmnrbwAAu9opvQ
	(envelope-from <linux-leds+bounces-6699-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 22 Jan 2026 13:39:27 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 764F966BEC
	for <lists+linux-leds@lfdr.de>; Thu, 22 Jan 2026 13:39:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 66073702A67
	for <lists+linux-leds@lfdr.de>; Thu, 22 Jan 2026 11:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 346A23E95B4;
	Thu, 22 Jan 2026 11:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S5EhQpRg"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE343033E5;
	Thu, 22 Jan 2026 11:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769082570; cv=none; b=TJyGjOo4GLDP6SmIPPjuCYctQRE3xzE0YAMkJEhPSKmkuhCxySnauUsdem8LaqI3wCrblB6yuDAAERPE0W0bewseju7FCeZfdhYGTvIDccKrOMsnEkxrv0DNY8kuKJe3o6TDrP8iPRhLPCYE0nLPQDMhJm2RiRmxPJDMG3NWgko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769082570; c=relaxed/simple;
	bh=51v7fMUb8/FkfU3h10UT/5FKya0EjHy89fKug/DAuKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UGOzDfbjkO15xpftqrtfuv2ZmthcroDTpNoycxu/cNrxbIfAtmmX4DUa0dazIhazQNmqS0k+oHcxmRjb37Bpam+yjEI4wEHl3jhqK1DhxAi0qGsbUQhJUuSVzTwsmSQ4DvMUs8VnjMPgpFOVH9pJRt04Q+gmNp9PmoVQcUxAx9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S5EhQpRg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96AAAC116C6;
	Thu, 22 Jan 2026 11:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769082569;
	bh=51v7fMUb8/FkfU3h10UT/5FKya0EjHy89fKug/DAuKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S5EhQpRgeaXFOs+3Ic+XF0Qn6wOoP3KFlhbwEeSgRvXoECOKYrQ6cttNJJkkov5vM
	 2F+K5cuvH62mMvreDyo7JQhyOSA2EayE0am5XYQVC1sSRYxc7thIrgSxDNpAEqTvwU
	 jns4hrjGJxNUyfTSm7AHEoJtTyh3iRTpQFSX9vDY9aocO2RTgZFU1fLHtE+eGvPclK
	 NdKRasHQ8mcZKcd/01UWI5Mtq14uhmpU41Vvblp9ClqkVAb2SN0t+0pd0xy+NcF/RG
	 jRtc1OjvCQg/uBsJFCxweqCmrsFrrERzXagKJMVbVuFwkTQn2qA2H7JNpMxFaoqXXy
	 xt1EfgecD+CAQ==
Date: Thu, 22 Jan 2026 11:49:25 +0000
From: Lee Jones <lee@kernel.org>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] leds: led-class: Only Add LED to leds_list when it is
 fully ready
Message-ID: <20260122114925.GF3831112@google.com>
References: <20251211163727.366441-1-johannes.goede@oss.qualcomm.com>
 <2bbtf7out2t52pge4hezfc7dryu6te2qstfm5kzez7zrw3dvqq@wxvqnjbulxc4>
 <585dc6a5-64e3-4f54-8ff3-9b9f1fc3d54d@oss.qualcomm.com>
 <20260108121142.GI302752@google.com>
 <70e4dec3-e4d9-409d-9ac3-aec814aec3bb@oss.qualcomm.com>
 <20260109093504.GA1118061@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260109093504.GA1118061@google.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6699-lists,linux-leds=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 764F966BEC
X-Rspamd-Action: no action

On Fri, 09 Jan 2026, Lee Jones wrote:

> On Thu, 08 Jan 2026, Hans de Goede wrote:
> 
> > Hi Lee,
> > 
> > On 8-Jan-26 13:11, Lee Jones wrote:
> > > On Fri, 12 Dec 2025, Hans de Goede wrote:
> > > 
> > >> Hi,
> > >>
> > >> On 12-Dec-25 07:49, Sebastian Reichel wrote:
> > >>> Hi,
> > >>>
> > >>> On Thu, Dec 11, 2025 at 05:37:27PM +0100, Hans de Goede wrote:
> > >>>> Before this change the LED was added to leds_list before led_init_core()
> > >>>> gets called adding it the list before led_classdev.set_brightness_work gets
> > >>>> initialized.
> > >>>>
> > >>>> This leaves a window where led_trigger_register() of a LED's default
> > >>>> trigger will call led_trigger_set() which calls led_set_brightness()
> > >>>> which in turn will end up queueing the *uninitialized*
> > >>>> led_classdev.set_brightness_work.
> > >>>>
> > >>>> This race gets hit by the lenovo-thinkpad-t14s EC driver which registers
> > >>>> 2 LEDs with a default trigger provided by snd_ctl_led.ko in quick
> > >>>> succession. The first led_classdev_register() causes an async modprobe of
> > >>>> snd_ctl_led to run and that async modprobe manages to exactly hit
> > >>>> the window where the second LED is on the leds_list without led_init_core()
> > >>>> being called for it, resulting in:
> > >>>>
> > >>>>  ------------[ cut here ]------------
> > >>>>  WARNING: CPU: 11 PID: 5608 at kernel/workqueue.c:4234 __flush_work+0x344/0x390
> > >>>>  Hardware name: LENOVO 21N2S01F0B/21N2S01F0B, BIOS N42ET93W (2.23 ) 09/01/2025
> > >>>>  ...
> > >>>>  Call trace:
> > >>>>   __flush_work+0x344/0x390 (P)
> > >>>>   flush_work+0x2c/0x50
> > >>>>   led_trigger_set+0x1c8/0x340
> > >>>>   led_trigger_register+0x17c/0x1c0
> > >>>>   led_trigger_register_simple+0x84/0xe8
> > >>>>   snd_ctl_led_init+0x40/0xf88 [snd_ctl_led]
> > >>>>   do_one_initcall+0x5c/0x318
> > >>>>   do_init_module+0x9c/0x2b8
> > >>>>   load_module+0x7e0/0x998
> > >>>>
> > >>>> Close the race window by moving the adding of the LED to leds_list to
> > >>>> after the led_init_core() call.
> > >>>>
> > >>>> Cc: Sebastian Reichel <sre@kernel.org>
> > >>>> Cc: stable@vger.kernel.org
> > >>>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> > >>>> ---
> > >>>
> > >>> heh, I've never hit this. But I guess that is not too surprising
> > >>> considering it is a race condition. The change looks good to me:
> > >>>
> > >>> Reviewed-by: Sebastian Reichel <sre@kernel.org>
> > >>
> > >> Thx.
> > >>  
> > >>>> Note no Fixes tag as this problem has been around for a long long time,
> > >>>> so I could not really find a good commit for the Fixes tag.
> > >>>
> > >>> My suggestion would be:
> > >>>
> > >>> Fixes: d23a22a74fde ("leds: delay led_set_brightness if stopping soft-blink")
> > >>
> > >> Ack, that works for me.
> > >>
> > >> Lee can you add this Fixes tag while merging ?
> > >>
> > >> Also (in case it is not obvious) this is a bugfix so it would be
> > >> nice if this could go in a fixes pull-request for 6.19.
> > > 
> > > Yes, I can add the Fixes: tag and no, I have no plans to send this for
> > > -fixes.  As you rightly mentioned, this issue has been around for a long
> > > time already.  I tend to only send -fixes pull-requests for things that
> > > broke in -rc1 of the same release.
> > 
> > Even though this has been around for a long time, it would be good
> > to get this in as a fix for 6.19-rc# because as described in the commit
> > msg the lenovo-thinkpad-t14s embedded-controller driver, which is new in
> > 6.19-rc1 manages to reliably trigger the race (for me, with a Fedora
> > kernel distconfig).
> > 
> > I was surprised I could hit the race pretty reliably, but it did make
> > debugging this easier.
> > 
> > Hitting the race also leads to a crash due to a NULL ptr deref after
> > the WARN(). I did not elaborate on this in the commit msg, because
> > the WARN() is the first sign of trying to use uninitialized mem.
> > 
> > IMHO having a reproducable race which causes a crash is
> > a good reason to submit this as a fix for 6.19 .
> 
> Noted.  Leave it with me.

https://lore.kernel.org/all/20260122114749.GE3831112@google.com/T/#u

-- 
Lee Jones [李琼斯]

