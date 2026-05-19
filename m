Return-Path: <linux-leds+bounces-8207-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGgFEXleDGoVggUAu9opvQ
	(envelope-from <linux-leds+bounces-8207-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 19 May 2026 14:58:33 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EE557F2C5
	for <lists+linux-leds@lfdr.de>; Tue, 19 May 2026 14:58:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 720F8306DAE8
	for <lists+linux-leds@lfdr.de>; Tue, 19 May 2026 12:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 115604C9576;
	Tue, 19 May 2026 12:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mcqueen.au header.i=craig@mcqueen.au header.b="MR8QQQuJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBBA4C9567
	for <linux-leds@vger.kernel.org>; Tue, 19 May 2026 12:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779195036; cv=pass; b=RcJAkKbOtc1FLdMFP9mnKEgH3Wjm93bMUlj5yE08kimEUGirmS6jb8tzy/nWdXt+rlcxcf13fYfKWuLcL7DyV2ILjcfEXVJZof6lmV8EI/HBndDE0nSltVlQLjAe3PS4qLUd7vXNnlSjAwvYOChUFgXjxskqQzc0aWvi18yUUtQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779195036; c=relaxed/simple;
	bh=CA2VsARVjPt/Zqsoh2ry/IhEIpUQkcxxlXPK9KOU1Xk=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=PIKj4emCR8zFMvuQSMvttQ/MKjnT/5/tezZ6Md9bIxFkA9/vvWhgs4LsEgV05e4PQyZjXGxoDyZGum64LvPqOZ406X7KVTKQ2OVcaH+wQgfro0PqYAD/GOsxnE/enyBisGUvJIRHPcEHjO284UOkhs2hEHRWSo/s+IpSKaNVCo8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mcqueen.au; spf=pass smtp.mailfrom=mcqueen.au; dkim=pass (1024-bit key) header.d=mcqueen.au header.i=craig@mcqueen.au header.b=MR8QQQuJ; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mcqueen.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mcqueen.au
ARC-Seal: i=1; a=rsa-sha256; t=1779195030; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WVpC3kfUNsUHojzVaQxXV3x4F0WsTy3RgCa+bXsG0MCfpoEIJYqYrllkMREHlFqOLLHb2bVvW8ew4v7lopOzBgsRZDQza476vsRp08shcdOYTjID9XN8zawRKFIWwPTIqBWH6NqteLJ0GSvDDrh6Y8nR7mJtw2HU3Eim2szw3fE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779195030; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=p3c9e7Plum7gk5/KxDcNFaigTC2Q+qt4ll1SIM1kBW0=; 
	b=InWPYcrAZ1L5jU37aD2iDXSMpHvPpPVmLPi6CI3doSv76j5yqSt4SvYKlZWFQsrEQsaXEJ7512MARmODNnuCLhEmGpGQOC7PiB5ASjcay0DXImsw+5UORefUdRxA3nhJHk/FwegcQWCRdBPCI5I29dUu12CAGJgf6H5ziCjgE6k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=mcqueen.au;
	spf=pass  smtp.mailfrom=craig@mcqueen.au;
	dmarc=pass header.from=<craig@mcqueen.au>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779195030;
	s=zmail; d=mcqueen.au; i=craig@mcqueen.au;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=p3c9e7Plum7gk5/KxDcNFaigTC2Q+qt4ll1SIM1kBW0=;
	b=MR8QQQuJo/W9aF262ULfJdfAjYDoyFsDR8l0a4CE40Cc349GMtrYBQbXVb6wTBaU
	9E2IL1RrUg+IFzJYYXXhvzFfj5Wf02UuoUGxsR+oZrT9A50rhNDa3RByDfa54G329NK
	9Yk2EqXkW3G6opoTFSQBpkiVOr3AA+Gf4S1imjNc=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1779195028508240.31521311356812; Tue, 19 May 2026 05:50:28 -0700 (PDT)
Date: Tue, 19 May 2026 22:50:28 +1000
From: Craig McQueen <craig@mcqueen.au>
To: "Lee Jones" <lee@kernel.org>
Cc: "linux-leds" <linux-leds@vger.kernel.org>
Message-ID: <19e4049a408.6f06f78b4616946.3248916341809186931@mcqueen.au>
In-Reply-To: <20260514164031.GQ305027@google.com>
References: <20260423113638.2079302-1-craig@mcqueen.au>
 <20260507115907.GF305027@google.com>
 <19e0507bcfe.b2da6346184484.1331248575877259177@mcqueen.au> <20260514164031.GQ305027@google.com>
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
X-Spamd-Result: default: False [-1.65 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[mcqueen.au:s=zmail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[mcqueen.au];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mcqueen.au:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[craig@mcqueen.au,linux-leds@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-8207-lists,linux-leds=lfdr.de];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mcqueen.au:email,mcqueen.au:mid,mcqueen.au:dkim]
X-Rspamd-Queue-Id: 76EE557F2C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Lee Jones wrote:
 > On Fri, 08 May 2026, Craig McQueen wrote: 
 > > Lee Jones wrote 
 > >  > On Thu, 23 Apr 2026, Craig McQueen wrote: 
 > >  > 
 > >  > > led_set_brightness() function: Change handling of software blink to 
 > >  > > avoid race conditions when stopping blink and setting brightness. 
 > >  > > 
 > >  > > Triggers may call led_set_brightness(LED_OFF), 
 > >  > > led_set_brightness(LED_FULL) in quick succession to disable blinking and 
 > >  > > turn the LED on. If the delayed work task has not yet disabled blinking 
 > >  > > by the time the second call occurs, then the brightness also needs to be 
 > >  > > changed in the delayed work task. 
 > >  > > 
 > >  > > Signed-off-by: Craig McQueen <craig@mcqueen.au> 
 > >  > > --- 
 > >  > >  drivers/leds/led-core.c | 33 ++++++++++++++++++++------------- 
 > >  > >  1 file changed, 20 insertions(+), 13 deletions(-) 
 > >  > 
 > >  > I think this needs more eyes on it and to be thoroughly tested by others. 
 > > 
 > > The problem I have seen is when a Linux driver controls a trigger to change it from flashing to steady-on. I've seen it specifically with LED core's software blinking. 
 > > 
 > > /* First stop the blinking */ 
 > > led_trigger_event(&udev->led_trigger, LED_OFF); 
 > > /* Next turn the LED steady-on */ 
 > > led_trigger_event(&udev->led_trigger, LED_FULL); 
 > > 
 > > Without this patch, the LED usually ends up in the off state, rather than on. 
 > > 
 > > I have tested this patch on a Rockchip RK3328 based system (ARM 64). 
 >  
 > I'm sure that this patch does work for you.  Just as the last iteration 
 > of this function has been working fine for everyone else for the last 10 
 > years.  However, since this is core change, I shall be exercising 
 > caution. 

I can readily reproduce this bug on multiple platforms:

* Texas Instruments AM335x 32-bit ARM (BeagleBone Black)
* Rockchip RK3328 64-bit ARM
* Ubuntu 25.10 on a laptop
* Ubuntu 22.04 on a VMware Workstation 16 Player VM

If others haven't seen it, maybe it's because this bug appears only with the intersection of two conditions:

1. A kernel driver that changes an LED trigger from blinking to steady-on (uncommon)
2. An LED that uses the kernel's LED software blinking, rather than hardware blinking

Note also that this issue doesn't seem to occur when controlling an LED from the sysfs interface:

echo timer > /sys/class/leds/test0/trigger
sleep 3
# First stop the blinking
echo 0 > /sys/class/leds/test0/brightness
# Next turn the LED steady-on
echo 1 > /sys/class/leds/test0/brightness

I guess because the sysfs interface adds enough extra time delays.

 > If anyone would be kind enough to test it, or provide some extra eyes, 
 > I'd be appreciative. 

I can offer the following method to test it.
I created a userspace LED trigger driver last year (submitted to linux-leds but not accepted).
https://github.com/cmcqueen/linux-kernel-uledtriggers

1. Make the Linux kernel driver out-of-tree.
    cd driver
    make
2. Load the driver.
    insmod ./ledtrig-user.ko
3. Make the test program.
    cd ../test/uledtriggers_c/
    make
4. Run the test program. It will create a new LED trigger named "blink-steady".
    ./uledtriggers_blink_steady
5. Connect an LED to the "blink-steady" trigger. It needs to be an LED that doesn't have hardware blinking. For example, using the Linux kernel uledmon.c:
    gcc uledmon.c -o uledmon
    modprobe uleds
    ./uledmon "test::test"
    echo "blink-steady" > "/sys/class/leds/test::test/trigger"

The LED trigger should make the LED blink for 5 seconds, and then steady-on for 5 seconds, then repeat.

With the kernel bug I've described, the LED is usually left OFF for 5 seconds rather than ON for 5 seconds as intended.

With the patch I submitted, this should be fixed.

-- 
Craig McQueen


