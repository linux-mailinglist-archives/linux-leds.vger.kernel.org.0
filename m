Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 806872837E5
	for <lists+linux-leds@lfdr.de>; Mon,  5 Oct 2020 16:34:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726068AbgJEOed (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 5 Oct 2020 10:34:33 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:43316 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725936AbgJEOec (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 5 Oct 2020 10:34:32 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 095EY0kB104540;
        Mon, 5 Oct 2020 09:34:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1601908440;
        bh=Nz6BnjFy1Ou1djB5Je8RF9iSVJK3Dpamj6aByeFNc48=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=xF18Evu0iPtfXcVYaq51CZsp2SWnM4F+2M4yWl9p60MJKjV+ZuUToKgldyTZK4Mki
         nmr32jfZdGgvZQpc8Iad5Pog9yNICMSSDZSAZkNWR8vKG60kpYqrxDSlthRYO36lSB
         7qxI6Qn6CZkpmYz+SGLr8F+FE8xvuBns+XNYVqjY=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 095EY0LS047551
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 5 Oct 2020 09:34:00 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 5 Oct
 2020 09:33:59 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 5 Oct 2020 09:33:59 -0500
Received: from [10.250.71.177] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 095EXuxQ063949;
        Mon, 5 Oct 2020 09:33:57 -0500
Subject: Re: [PATCH] leds: lm3697: Fix out-of-bound access
To:     <ultracoolguy@tutanota.com>, Marek Behun <kabel@blackhole.sk>
CC:     Pavel <pavel@ucw.cz>, Linux Leds <linux-leds@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>
References: <MIiYgay--3-2@tutanota.com> <20201005141334.36d9441a@blackhole.sk>
 <MIt2NiS--3-2@tutanota.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <3c5fce56-8604-a7d5-1017-8a075f67061e@ti.com>
Date:   Mon, 5 Oct 2020 09:33:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <MIt2NiS--3-2@tutanota.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Marek

On 10/5/20 8:57 AM, ultracoolguy@tutanota.com wrote:
> I agree with you.
>
> Attached patch with changes.

Nack to the patch.

The subject says it does one thing but you also unnecessarily changed 
the name of the structure.

Renaming the structure does not fix the underlying issue

Dan

