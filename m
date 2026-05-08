Return-Path: <linux-leds+bounces-8043-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Oo70NyAx/WnGYgAAu9opvQ
	(envelope-from <linux-leds+bounces-8043-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 08 May 2026 02:41:04 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1924E4F080F
	for <lists+linux-leds@lfdr.de>; Fri, 08 May 2026 02:41:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 707A9301CCDD
	for <lists+linux-leds@lfdr.de>; Fri,  8 May 2026 00:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 848132F8EB6;
	Fri,  8 May 2026 00:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mcqueen.au header.i=craig@mcqueen.au header.b="AynqX1gw"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02336173
	for <linux-leds@vger.kernel.org>; Fri,  8 May 2026 00:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778200861; cv=pass; b=FJK2n1nON4tLuOUMOw7rSIiAHDaS32/eH+zSyWUW94gbskFX8FHIbOjRw24Cr/NgN3OC+pDpgZqiPDJmaukZDPSQzoaPS/usRTtfhB74nBv35c294CmC2J9oK9AprxnEngtGIYBHh5C6jQpcDCGCAdPVBhS2++ShY5kjqUgfzhE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778200861; c=relaxed/simple;
	bh=heNJM9IdnHxH6yC0xUCas93OLoSjpDesKgEWNWicIq4=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=EEw9Vdsz8gGvvxTilybBsC9UTO0yksqMDW7miJWvCcUenLr8FwF/Nl5yce58nbB2l2mvDZr9M6gFDWXkaWRdQ1+OeAQjg47FuDAMEps/0JGfubAaJa+IhofPvBrpBs/cpoqEKHw0qlV10oa0lJuLLWIwC3YbHsvFUXvQZEnYZHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mcqueen.au; spf=pass smtp.mailfrom=mcqueen.au; dkim=pass (1024-bit key) header.d=mcqueen.au header.i=craig@mcqueen.au header.b=AynqX1gw; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mcqueen.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mcqueen.au
ARC-Seal: i=1; a=rsa-sha256; t=1778200854; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Q7ha027h711axWotX6nLGq0cD0Nf7a7xMJ1o+BZDKcU0766HfKpQefcL+nh1vOA6LopE5jC0DXHB174qiOMIiO+PRVIUaDidN/u0SsExaKBr2hJAtUiN7ooV0lhcaJcDHGNp3V3rTQqOza6IQACxAge9z6AYASYOntW7M2zVI0Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1778200854; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=UV4hgluCuQUuutO7hQf/Nd+sZgf13JhFTioqeMUV0D8=; 
	b=KlNYvnkjzhPUsmZ83SIWlHx7oSyzepweX2UUTWZ2gkjtbvsPeCOOsYRqKLhDQexXjmKOlwOTmki8LU9i0NHYYYSaXLkMg8zS0fsjO8tOV+HJFljl6D2aQBl0oqOBK6s0K8tKfvg5johK4py8wiy46MU3+olzn5CFNHhW1sfjruI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=mcqueen.au;
	spf=pass  smtp.mailfrom=craig@mcqueen.au;
	dmarc=pass header.from=<craig@mcqueen.au>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778200854;
	s=zmail; d=mcqueen.au; i=craig@mcqueen.au;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=UV4hgluCuQUuutO7hQf/Nd+sZgf13JhFTioqeMUV0D8=;
	b=AynqX1gwtaPqA2msHZpqvAYpcf6Ej8hrNL0++S4AMO+FKj4Ur+XURqjasPjERLxk
	wklK7N3YO3YGGFTGXaaQpqDZAgJksSuwP3Na1H49Pk/es0Y4EsKvnbkanOkxXgUFXef
	gwyoW4ufavF+dUTPIeDfE4juN0hZuvIBNCVd2pYQ=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1778200853776388.1426699038027; Thu, 7 May 2026 17:40:53 -0700 (PDT)
Date: Fri, 08 May 2026 10:40:53 +1000
From: Craig McQueen <craig@mcqueen.au>
To: "Lee Jones" <lee@kernel.org>
Cc: "linux-leds" <linux-leds@vger.kernel.org>
Message-ID: <19e0507bcfe.b2da6346184484.1331248575877259177@mcqueen.au>
In-Reply-To: <20260507115907.GF305027@google.com>
References: <20260423113638.2079302-1-craig@mcqueen.au> <20260507115907.GF305027@google.com>
Subject: Re: [PATCH] leds: core: Fix race condition for software blink
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-Rspamd-Queue-Id: 1924E4F080F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.65 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[mcqueen.au:s=zmail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_ALL(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DMARC_NA(0.00)[mcqueen.au];
	TAGGED_FROM(0.00)[bounces-8043-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[craig@mcqueen.au,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[mcqueen.au:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+]
X-Rspamd-Action: no action

Lee Jones wrote
 > On Thu, 23 Apr 2026, Craig McQueen wrote: 
 >  
 > > led_set_brightness() function: Change handling of software blink to 
 > > avoid race conditions when stopping blink and setting brightness. 
 > > 
 > > Triggers may call led_set_brightness(LED_OFF), 
 > > led_set_brightness(LED_FULL) in quick succession to disable blinking and 
 > > turn the LED on. If the delayed work task has not yet disabled blinking 
 > > by the time the second call occurs, then the brightness also needs to be 
 > > changed in the delayed work task. 
 > > 
 > > Signed-off-by: Craig McQueen <craig@mcqueen.au> 
 > > --- 
 > >  drivers/leds/led-core.c | 33 ++++++++++++++++++++------------- 
 > >  1 file changed, 20 insertions(+), 13 deletions(-) 
 >  
 > I think this needs more eyes on it and to be thoroughly tested by others. 

The problem I have seen is when a Linux driver controls a trigger to change it from flashing to steady-on. I've seen it specifically with LED core's software blinking.

/* First stop the blinking */
led_trigger_event(&udev->led_trigger, LED_OFF);
/* Next turn the LED steady-on */
led_trigger_event(&udev->led_trigger, LED_FULL);

Without this patch, the LED usually ends up in the off state, rather than on.

I have tested this patch on a Rockchip RK3328 based system (ARM 64).

 > > diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c 
 > > index 385e78af1dac..073c547068cc 100644 
 > > --- a/drivers/leds/led-core.c 
 > > +++ b/drivers/leds/led-core.c 
 > > @@ -303,24 +303,31 @@ EXPORT_SYMBOL_GPL(led_stop_software_blink); 
 > > 
 > >  void led_set_brightness(struct led_classdev *led_cdev, unsigned int brightness) 
 > >  { 
 > > -    /* 
 > > -     * If software blink is active, delay brightness setting 
 > > -     * until the next timer tick. 
 > > -     */ 
 > > -    if (test_bit(LED_BLINK_SW, &led_cdev->work_flags)) { 
 > > +    if (brightness) { 
 > >          /* 
 > > -         * If we need to disable soft blinking delegate this to the 
 > > -         * work queue task to avoid problems in case we are called 
 > > -         * from hard irq context. 
 > > +         * If software blink disable is pending, also queue brightness setting. 
 > > +         * If software blink is active, delay brightness setting 
 > > +         * until the next timer tick. 
 > >           */ 
 > > -        if (!brightness) { 
 > > -            set_bit(LED_BLINK_DISABLE, &led_cdev->work_flags); 
 > > +        if (test_bit(LED_SET_BRIGHTNESS, &led_cdev->work_flags) || 
 > > +            test_bit(LED_BLINK_DISABLE, &led_cdev->work_flags)) { 
 > > +            led_cdev->delayed_set_value = brightness; 
 > > +            set_bit(LED_SET_BRIGHTNESS, &led_cdev->work_flags); 
 > >              queue_work(led_cdev->wq, &led_cdev->set_brightness_work); 
 > > -        } else { 
 > > -            set_bit(LED_BLINK_BRIGHTNESS_CHANGE, 
 > > -                &led_cdev->work_flags); 
 > > +            return; 
 > > +        } else if (test_bit(LED_BLINK_SW, &led_cdev->work_flags)) { 
 > >              led_cdev->new_blink_brightness = brightness; 
 > > +            set_bit(LED_BLINK_BRIGHTNESS_CHANGE, &led_cdev->work_flags); 
 > > +            return; 
 > >          } 
 > > +    } else if (test_bit(LED_BLINK_SW, &led_cdev->work_flags)) { 
 > > +        /* 
 > > +         * If we need to disable soft blinking delegate this to the 
 > > +         * work queue task to avoid problems in case we are called 
 > > +         * from hard irq context. 
 > > +         */ 
 > > +        set_bit(LED_BLINK_DISABLE, &led_cdev->work_flags); 
 > > +        queue_work(led_cdev->wq, &led_cdev->set_brightness_work); 
 > >          return; 
 > >      } 
 > > 
 > > -- 
 > > 2.52.0 
 > > 

