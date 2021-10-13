Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F67042BAA6
	for <lists+linux-leds@lfdr.de>; Wed, 13 Oct 2021 10:39:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230092AbhJMIlH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 13 Oct 2021 04:41:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbhJMIlH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 13 Oct 2021 04:41:07 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 466A7C061570
        for <linux-leds@vger.kernel.org>; Wed, 13 Oct 2021 01:39:04 -0700 (PDT)
Date:   Wed, 13 Oct 2021 10:39:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1634114341;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=XZ9j28fTCTKVlZ0hdi0dGob4kuJaoD6u0oYTbXh5kto=;
        b=wwVlQ9ffmUqEFIU1SW7z0ZmV8J+FgJQpy5SQmbLczY2IPfRIKjE569Y0OoLx614c7UPWuS
        bRCOE/UpdaM8zKFwhVsoHX1oZWooQRiEmtHN4xuWALYXli3bMZaXXY3dL3GUoOBi8ZuP5M
        PVoeGnnHE+xii1l5rGZJkLpg8/qAMGL3P0qPn41T1mEPszPiA0cjUgG/9hA49K3j7+r1tj
        G9aX66xo7a78jiNVR2qgueH7nPkVAOoHgT4OPtuT5Z6Hya36AYpFEI2ohs5gHaVmCgw2D7
        hvy5mEekAxzH6J8qdLWJOmo2e6JHxC7rPDSgkNb2UVgcEAnFbXOH3SBBPp38Rg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1634114341;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=XZ9j28fTCTKVlZ0hdi0dGob4kuJaoD6u0oYTbXh5kto=;
        b=f4g06zf3gc6g4k7dlmIRQTDuqzryukfVsdBNrEq+V27BZoY62IWYW8Uk7cFEV4+GMODy7h
        Kt3r1kP77iWSqpDg==
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Thomas Gleixner <tglx@linutronix.de>, johannes.berg@intel.com,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: trigger: Disable CPU trigger on PREEMPT_RT
Message-ID: <20211013083900.g4pqwpov62cm2zsw@linutronix.de>
References: <20210924111501.m57cwwn7ahiyxxdd@linutronix.de>
 <20210927142345.GB18276@duo.ucw.cz>
 <87wnn2av6h.ffs@tglx>
 <20210927154451.GA17112@duo.ucw.cz>
 <20210927171802.uak3tbpqaig3mm7m@linutronix.de>
 <20210927190650.GA13992@duo.ucw.cz>
 <20210927193424.glrddglskpohbosn@linutronix.de>
 <20211013080838.GA10864@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211013080838.GA10864@amd>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 2021-10-13 10:08:38 [+0200], Pavel Machek wrote:
> Hi!
Hi,

> > - The idle loop (x86 or ARM makes no difference) is always invoked with
> >   disabled interrupts and so sleeping is a no no on PREEMPT_RT. So a
> >   spinlock_t can not be acquired in this context.
> 
> Ok, I have reviewed code, and your patch seems like a way forward. Can
> you resubmit it with fixed changelog?

Could you please point me what to needs to be fixed in the changelog?
I mentioned the read lock which is acquired with disabled interrupts
and this does not work on PREEMPT_RT.

> Thanks,
> 								Pavel

Sebastian
