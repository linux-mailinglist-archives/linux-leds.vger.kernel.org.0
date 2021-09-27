Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7DE8419801
	for <lists+linux-leds@lfdr.de>; Mon, 27 Sep 2021 17:35:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235095AbhI0Pgp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Sep 2021 11:36:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234622AbhI0Pgo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Sep 2021 11:36:44 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77F8EC061575
        for <linux-leds@vger.kernel.org>; Mon, 27 Sep 2021 08:35:06 -0700 (PDT)
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1632756903;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=6IXMVVZjYssDHaMNRuUCueM7YZo/VuTyaLcpyKcm864=;
        b=cctEed4bwD0DvyHKIRQrfHVTm8I6SnJ/RCtf/JU6n5zV07MMFHdUZwY9eTC7GJOnvSiaDO
        3d/XWwDZmoTyFv2bI7YkRMbs7D30KFhHyDOe7Ba6mCT7rwcAe29mwl0CNTpwnqsLD+3ZEh
        MDr2O87WZwdCidAvWrr73kgeG1cuakOkN0LkM85BAwPiRusWKCDPO+zZoGrOJJ7Ut459DF
        LeeeXehw9slskAZMCivwL/EnHSjAAKSg2t3vxGhNhuawBCBAhzPGf//ThmAdGnNklzBpGm
        uo9foIDowEBarXRb24Cm5O7cDTQkim1n431wv+YqL4EK3CQ5QYqQzbzNSPr/fw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1632756903;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=6IXMVVZjYssDHaMNRuUCueM7YZo/VuTyaLcpyKcm864=;
        b=PDQcfKmOMVGSAde9bTSNdru0PuZW/6BWelr5ZCA1jMQarlwh1kaUJDizHoKRwEJ4eLXJHh
        0NeMf7jgbT6wVYBA==
To:     Pavel Machek <pavel@ucw.cz>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        johannes.berg@intel.com
Cc:     linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: trigger: Disable CPU trigger on PREEMPT_RT
In-Reply-To: <20210927142345.GB18276@duo.ucw.cz>
References: <20210924111501.m57cwwn7ahiyxxdd@linutronix.de>
 <20210927142345.GB18276@duo.ucw.cz>
Date:   Mon, 27 Sep 2021 17:35:02 +0200
Message-ID: <87wnn2av6h.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel,

On Mon, Sep 27 2021 at 16:23, Pavel Machek wrote:
>
>> The CPU trigger is invoked on ARM from CPU-idle. That trigger later
>> invokes led_trigger_event() which acquires a read lock in an IRQ-off
>> section. The problematic part on PREEMPT_RT is that this lock is turned
>> into a sleeping lock and must not be acquired with disabled interrupts.
>> 
>> The problem continues as that the LED driver underneath must not acquire
>> any sleeping locks itself.
>> 
>> Disable the CPU trigger on PREEMPT_RT.
>
> I know locking with leds is problematic, but I believe you'll hit
> similar problem elsewhere... Disabling triggers is not solution.

Disabling stuff which is not working well with RT is very much a
solution in order to make progress.

We have surely more essential problems to solve than making leds blink
and if anyone cares enough about them, then this can be worked on in
parallel. That has been disabled on RT for ever and so far nobody
complained or cared enough about it.

Thanks,

        tglx

