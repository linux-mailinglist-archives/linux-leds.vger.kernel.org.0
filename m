Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7804B419E91
	for <lists+linux-leds@lfdr.de>; Mon, 27 Sep 2021 20:48:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236312AbhI0SuH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Sep 2021 14:50:07 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:58582 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234211AbhI0SuH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Sep 2021 14:50:07 -0400
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1632768507;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=8BGlrwhl0ZM/cvrS5DhwVcIKaCB7N0GdYz6xRTCEVns=;
        b=n5RI0ORWCst6lQMymCYc+7raQfuNYV/eoQS5AuChy1W6Sh8YgJQJ4+6QM/8n85dkCXvoVC
        peLzecec9W+Rqd7TsxVubSf83O/XJH0yhGiZXbmGRqUc22QuOo0PmWBxO37fi7x8H1a88w
        ZFNv8Fzb/LNdSwpMpyJ6wtRgK706HkMQw+FofL59r5vLmMv3o5b17g66BmsE5kti/r2Eke
        v1BaiFas6QKd2neUBfqC0hgFOR7QbCAwMRnUI7Oqxa5BaxRPLCGEj847XrgHRDq4GDJDml
        WpRxXYgD29XGHQiCHkvcAXELbYIo3GLOzZ6+9avgWKxJJa0AGKCcgGXRDBvrvg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1632768507;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=8BGlrwhl0ZM/cvrS5DhwVcIKaCB7N0GdYz6xRTCEVns=;
        b=WTlRnmTR9h6M7hCpeKsaFgq5It0sQK31i4IP1rCTGQwFbHtaaSuUg/4pi0Hbk5cejCJcvw
        qSfqOF9Ot/IR59DA==
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        johannes.berg@intel.com, linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: trigger: Disable CPU trigger on PREEMPT_RT
In-Reply-To: <20210927154451.GA17112@duo.ucw.cz>
References: <20210924111501.m57cwwn7ahiyxxdd@linutronix.de>
 <20210927142345.GB18276@duo.ucw.cz> <87wnn2av6h.ffs@tglx>
 <20210927154451.GA17112@duo.ucw.cz>
Date:   Mon, 27 Sep 2021 20:48:27 +0200
Message-ID: <87mtnxc0sk.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel,

On Mon, Sep 27 2021 at 17:44, Pavel Machek wrote:
> On Mon 2021-09-27 17:35:02, Thomas Gleixner wrote:
>> Disabling stuff which is not working well with RT is very much a
>> solution in order to make progress.
>> 
>> We have surely more essential problems to solve than making leds blink
>> and if anyone cares enough about them, then this can be worked on in
>> parallel. That has been disabled on RT for ever and so far nobody
>> complained or cared enough about it.
>
> Would you mind reading and responding to the rest of the email?

Sure. As Sebastian said, its not only the rwlock in led-triggers, it's
the whole call chain down to led_cdec->set_brightness() with a gazillion
of drivers and quite some of them take locks.

> I'm not applying this.

That's fine with me, I just move arch/arm RT support to the very end of
my todo list then.

Thanks for your support!

       tglx
