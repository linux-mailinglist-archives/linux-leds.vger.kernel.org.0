Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF3AF2D8C72
	for <lists+linux-leds@lfdr.de>; Sun, 13 Dec 2020 09:52:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405183AbgLMIvy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 13 Dec 2020 03:51:54 -0500
Received: from smtprelay0076.hostedemail.com ([216.40.44.76]:38286 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728170AbgLMIvr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Sun, 13 Dec 2020 03:51:47 -0500
X-Greylist: delayed 646 seconds by postgrey-1.27 at vger.kernel.org; Sun, 13 Dec 2020 03:51:47 EST
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave02.hostedemail.com (Postfix) with ESMTP id 3959D1800084D
        for <linux-leds@vger.kernel.org>; Sun, 13 Dec 2020 08:40:55 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay02.hostedemail.com (Postfix) with ESMTP id 172151E06;
        Sun, 13 Dec 2020 08:40:14 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:800:960:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1539:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:2693:2828:3138:3139:3140:3141:3142:3352:3622:3865:3867:3870:3871:3872:3873:3874:4321:5007:6691:7514:10004:10400:10848:11232:11658:11914:12297:12740:12760:12895:13069:13311:13357:13439:14181:14659:14721:21080:21627,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: neck30_631061227410
X-Filterd-Recvd-Size: 1954
Received: from XPS-9350.home (unknown [47.151.137.21])
        (Authenticated sender: joe@perches.com)
        by omf07.hostedemail.com (Postfix) with ESMTPA;
        Sun, 13 Dec 2020 08:40:11 +0000 (UTC)
Message-ID: <3ce8fa0c0d7a2c38b532bd4944f4158cfa0db072.camel@perches.com>
Subject: Re: [PATCH] leds: Use DEVICE_ATTR_{RW, RO, WO} macros
From:   Joe Perches <joe@perches.com>
To:     Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     linux-leds@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-kernel-mentees@lists.linuxfoundation.org
Date:   Sun, 13 Dec 2020 00:40:10 -0800
In-Reply-To: <CABJPP5BeB-aXDDk-8vy-8dOaNaM5jitx6QWKtV7Y3zXM5DgvUA@mail.gmail.com>
References: <20201212195548.231494-1-dwaipayanray1@gmail.com>
         <CAKXUXMx9EnhWhGAJf4ousAgkxDUrN=g2zGaPEk6ijJYse7VJaQ@mail.gmail.com>
         <CABJPP5BeB-aXDDk-8vy-8dOaNaM5jitx6QWKtV7Y3zXM5DgvUA@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, 2020-12-13 at 13:48 +0530, Dwaipayan Ray wrote:
> On Sun, Dec 13, 2020 at 1:31 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
[]
> > Will you also add a checkpatch rule to identify other DEVICE_ATTR(...)
> > that can be adjusted to the refined macros, so that checkpatch informs
> > other submitters as well?
> > 
> I think a checkpatch rule for this already exists. But it cannot automatically
> rename the function names. That might be the only drawback we got.
> Probably clang-format could fix these automatically.

clang-format is not a tool to rewrite code only neaten its layout.

coccinelle _might_ be able to do this for limited cases where the
show function is in the same compilation unit/file, but even then
it would not be a trivial script.


