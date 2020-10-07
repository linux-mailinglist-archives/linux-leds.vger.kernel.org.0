Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8F9928619D
	for <lists+linux-leds@lfdr.de>; Wed,  7 Oct 2020 16:56:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728641AbgJGO44 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 7 Oct 2020 10:56:56 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:42256 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728637AbgJGO44 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 7 Oct 2020 10:56:56 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 097EuO0G077454;
        Wed, 7 Oct 2020 09:56:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1602082584;
        bh=67uOMzd2/z5aPdWJGGmYdVbEfaUxAlC1A5+y2mSmvPQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=LTkReH9J+vm3PZMYumPiso2D3wzau/eZ3an1mRAWyurw4GfeGQryumuYBo/N7daL+
         feZN+EhXPdX/VLpjtm5C29hrInlFIlfx/X161fXphTGGiefbau5zVh8H5IVleu0U9S
         VBfWqR4qk9IpzQ7NEaZKHmxqVd1OG0aIGhObWnQg=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 097EuObl085587
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 7 Oct 2020 09:56:24 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 7 Oct
 2020 09:56:24 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 7 Oct 2020 09:56:24 -0500
Received: from [10.250.71.177] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 097EuNEU020180;
        Wed, 7 Oct 2020 09:56:23 -0500
Subject: Re: [PATCH] lm3697: Rename struct into more appropiate name
To:     <ultracoolguy@tutanota.com>, Marek Behun <kabel@blackhole.sk>
CC:     Pavel <pavel@ucw.cz>, Linux Leds <linux-leds@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>
References: <MIuPIKy--3-2@tutanota.com> <20201007012600.3b3e7779@blackhole.sk>
 <MJ2-gcy----2@tutanota.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <346621c1-757e-d182-d290-877fccc8b4aa@ti.com>
Date:   Wed, 7 Oct 2020 09:56:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <MJ2-gcy----2@tutanota.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Gabriel

On 10/7/20 7:21 AM, ultracoolguy@tutanota.com wrote:
> The reason I didn't use git send-mail earlier is because Tutanota doesn't supports SMTP and Protonmail requires a paid account for using SMTP/IMAP. However, I made an account creation request for Disroot(which does support SMTP for free), so when/if the account gets created I'll send future patches through there.
> Oct 6, 2020, 23:26 by kabel@blackhole.sk:
>
>
Also please note top posting on emails is not preferred. As you will 
find in the LED domain bottom posts and trimming emails to what is being 
commented on is preferred.

As demonstrated.

Dan

