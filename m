Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A800142BB26
	for <lists+linux-leds@lfdr.de>; Wed, 13 Oct 2021 11:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234702AbhJMJKv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 13 Oct 2021 05:10:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233922AbhJMJKu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 13 Oct 2021 05:10:50 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA365C061570
        for <linux-leds@vger.kernel.org>; Wed, 13 Oct 2021 02:08:47 -0700 (PDT)
Date:   Wed, 13 Oct 2021 11:08:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1634116126;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ShTorPJrw0PjHlriodv1a+TSPJx9P0NEEJdp7eAgWzA=;
        b=N8ciaCgIKTK60o50O5tuRl91tXRSO6AytFMwE4hOF4wJWsbkhao0HWSVLS9IqAaoy8kwa7
        JOQnlYDQlsAH9NylfxHvIIkrSY8mpH+U0nlEIgxrTKpb9qHHT70vZxLYVrXPKWCKlbVndb
        z/Yu7AdCxdHbbSum/eZJbxVEf9zbf8JpSkM8nfBR2EQ8qr9UEpDqDFmQTT/UXaT+4qr+2v
        5mcXDsZYUvJGGGG4m44vR36HSzUz+aFDAE3BqKc3vor7tB3/xuPwjOMpoUKzZ53a/T6nPV
        N1O0MqfH8MGCURQPtVDNdnm9ABRy8LdWQ+Ic+AhlGWHE5ciNYRczpG24ub6lrQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1634116126;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ShTorPJrw0PjHlriodv1a+TSPJx9P0NEEJdp7eAgWzA=;
        b=HPqx/wxtk2bM0j3AS6yLFgbw7f0mM9gnfJM9c9fzlkG7yP8hZFDk2ncSediuFWwxPsWenV
        bvZAgjs9M4475IAQ==
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Thomas Gleixner <tglx@linutronix.de>, johannes.berg@intel.com,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: trigger: Disable CPU trigger on PREEMPT_RT
Message-ID: <20211013090845.bpfjjfi42wxu6hji@linutronix.de>
References: <20210924111501.m57cwwn7ahiyxxdd@linutronix.de>
 <20210927142345.GB18276@duo.ucw.cz>
 <87wnn2av6h.ffs@tglx>
 <20210927154451.GA17112@duo.ucw.cz>
 <20210927171802.uak3tbpqaig3mm7m@linutronix.de>
 <20210927190650.GA13992@duo.ucw.cz>
 <20210927193424.glrddglskpohbosn@linutronix.de>
 <20211013080838.GA10864@amd>
 <20211013083900.g4pqwpov62cm2zsw@linutronix.de>
 <20211013084237.GA13150@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211013084237.GA13150@amd>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 2021-10-13 10:42:37 [+0200], Pavel Machek wrote:
Hi,

> The read lock is gone in linux-next now (it was problematic for other
> reasons and it was not the main problem).

Okay, thanks for the update.

> 								Pavel

Sebastian
