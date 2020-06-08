Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5501F1F1F13
	for <lists+linux-leds@lfdr.de>; Mon,  8 Jun 2020 20:35:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbgFHSfp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 8 Jun 2020 14:35:45 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:49950 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725468AbgFHSfp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 8 Jun 2020 14:35:45 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 058IZf9U084540;
        Mon, 8 Jun 2020 13:35:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1591641341;
        bh=eHHa7AodQrze13nOKG82sHxSg589G5pCOP+wqJ1onsw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=rJuzjWrSienjycKqqtYMN0mQ5AbpdBviACGKVh63TpexqCnNNmMT2SBtubDV70H2s
         FsRjKMcYMrbQXi3PfI7c/WZY/slk80RQKdCNezcLuAOF6S43gIFMLyw2ZEEALnOrGD
         lMPLPappRbuaQxCVqSqE8Z4Doa9jP2+BOcbjvqQg=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 058IZfPX019793
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 8 Jun 2020 13:35:41 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 8 Jun
 2020 13:35:41 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 8 Jun 2020 13:35:41 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 058IZf1b069557;
        Mon, 8 Jun 2020 13:35:41 -0500
Subject: Re: [PATCH v26 00/15] Multicolor Framework v26
To:     Pavel Machek <pavel@ucw.cz>
CC:     <jacek.anaszewski@gmail.com>, <devicetree@vger.kernel.org>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20200604120504.32425-1-dmurphy@ti.com>
 <20200606155747.GB21130@amd>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <e7b26b67-cbb9-d139-a105-6a02bd45179f@ti.com>
Date:   Mon, 8 Jun 2020 13:35:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200606155747.GB21130@amd>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 6/6/20 10:57 AM, Pavel Machek wrote:
> Hi!
>
>> This is the multi color LED framework.   This framework presents clustered
>> colored LEDs into an array and allows the user space to adjust the brightness
>> of the cluster using a single file write.  The individual colored LEDs
>> intensities are controlled via a single file that is an array of LEDs
> Can you re-order the patches so that stuff that can be applied now
> goes first? Bugfixes, cleanups, devm conversion, yaml conversions that
> are already acked...

This series should be close to being applied. I am almost done making 
v26 changes.

I don't want to re-order this series.

Dan

