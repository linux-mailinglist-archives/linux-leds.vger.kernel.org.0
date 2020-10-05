Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CE872837F6
	for <lists+linux-leds@lfdr.de>; Mon,  5 Oct 2020 16:38:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726160AbgJEOix (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 5 Oct 2020 10:38:53 -0400
Received: from w1.tutanota.de ([81.3.6.162]:47612 "EHLO w1.tutanota.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725936AbgJEOix (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 5 Oct 2020 10:38:53 -0400
Received: from w3.tutanota.de (unknown [192.168.1.164])
        by w1.tutanota.de (Postfix) with ESMTP id 82E6AFA03D3;
        Mon,  5 Oct 2020 14:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1601908731;
        s=s1; d=tutanota.com;
        h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
        bh=FBKOPUvAuNm6fEt8T8JRj0ijtvKSx3emCy80YIZxL4w=;
        b=XLVhftzC02EhPKFUeKpYUnyTb8lrbkW3ZznHmPCt3sv+wTh4Z6rxV6zhk1EKeEoC
        hR3OfrRD/2TbbtlVuwYn33iVy2HK9E//yzAqMpXjz6KfipJ026KiYMWVluGCdLc4mmY
        GHugccq2kWoAGX6PxqoGT92l/ASIqhFKc361S8QfTaaoQjBWWlc4ALR0Nj64d26ufYt
        8C53xWgkKSg5SS/YpLRynLdNEApl+Dj0gEIdWHg6G1O78s6C/4AAwqURwplJ3hYokKP
        YTo5yx3Dn8w5Wv5YGpi2T3qT9pnV/KwqkUhKW4L6dY3AWvIc9IKY9wWg3HNvUYMTLBJ
        7XAcGw73qg==
Date:   Mon, 5 Oct 2020 16:38:51 +0200 (CEST)
From:   ultracoolguy@tutanota.com
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Marek Behun <kabel@blackhole.sk>, Pavel <pavel@ucw.cz>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        Linux Leds <linux-leds@vger.kernel.org>
Message-ID: <MItBqjy--3-2@tutanota.com>
In-Reply-To: <3c5fce56-8604-a7d5-1017-8a075f67061e@ti.com>
References: <MIiYgay--3-2@tutanota.com> <20201005141334.36d9441a@blackhole.sk> <MIt2NiS--3-2@tutanota.com> <3c5fce56-8604-a7d5-1017-8a075f67061e@ti.com>
Subject: Re: [PATCH] leds: lm3697: Fix out-of-bound access
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

I understand. So I should leave it like it was and do the rename in another patch? 

Oct 5, 2020, 14:33 by dmurphy@ti.com:

> Marek
>
> On 10/5/20 8:57 AM, ultracoolguy@tutanota.com wrote:
>
>> I agree with you.
>>
>> Attached patch with changes.
>>
>
> Nack to the patch.
>
> The subject says it does one thing but you also unnecessarily changed the name of the structure.
>
> Renaming the structure does not fix the underlying issue
>
> Dan
>

