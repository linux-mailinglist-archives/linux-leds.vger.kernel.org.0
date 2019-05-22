Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C17A026D1C
	for <lists+linux-leds@lfdr.de>; Wed, 22 May 2019 21:40:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729753AbfEVTjW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 May 2019 15:39:22 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:42886 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730499AbfEVTjU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 May 2019 15:39:20 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4MJdGYU019877;
        Wed, 22 May 2019 14:39:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1558553956;
        bh=tVnRlstl7Mo/U/69hUYQHMBs9wUpC3OGi4TdChwiOds=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=fR1Gex2n0/fUaqP5qx4+vDJ7f+Zm9QEzvkzu+pFhsQz8SxpTcr0gIA3ZCBhoojgaK
         xjz8csMK9Sb0dM7KApU/VGKW850ylqc4qxbbkqV+8c84+Uktz6a8tGw03IEvENFkoD
         I8ZJmGE1kaHYib/tnrtXwqgVXdFOE/GW++92snzw=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4MJdGoA022863
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 22 May 2019 14:39:16 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 22
 May 2019 14:39:16 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 22 May 2019 14:39:16 -0500
Received: from [10.250.90.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4MJdFbJ046989;
        Wed, 22 May 2019 14:39:15 -0500
Subject: Re: [PATCH v4 0/6] LM36274 Introduction
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>,
        <broonie@kernel.org>, <lgirdwood@gmail.com>
CC:     <lee.jones@linaro.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20190522192733.13422-1-dmurphy@ti.com>
 <6501a8b5-8068-4c9d-6b51-ef00fa72c6d5@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <2a8a9fa5-9338-bb17-e273-b1e0278a566d@ti.com>
Date:   Wed, 22 May 2019 14:39:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <6501a8b5-8068-4c9d-6b51-ef00fa72c6d5@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 5/22/19 2:37 PM, Jacek Anaszewski wrote:
> Hi Dan,
> 
> On 5/22/19 9:27 PM, Dan Murphy wrote:
>> Hello
>>
>> This is patch set v4 for the LM36274.  There were no changes made
>> to this patch set except to rebase this on top of the latest TI LMU common code
>> patchset.
> 
> Why the rebase was needed? leds-lm36274.c was already including
> leds-ti-lmu-common.h.
> 

I just resent the patchset.

This was the cover letter in the series I sent originally.

Dan

<snip>
