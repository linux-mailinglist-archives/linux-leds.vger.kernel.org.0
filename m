Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C7DA1CFDF2
	for <lists+linux-leds@lfdr.de>; Tue, 12 May 2020 21:04:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbgELTEA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 12 May 2020 15:04:00 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:36144 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725554AbgELTEA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 12 May 2020 15:04:00 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04CJ3spL029060;
        Tue, 12 May 2020 14:03:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1589310234;
        bh=qcbTpSQDtrJd8P3InK+kcQIpK4vn56pKJLFbaxEiX4U=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Qz3xobuHHP6zDA9LTYeq/ZP8Y6f3ZXsAm20QyrtRrbisC1Ph0xI/vPamOQXcmwnF7
         TRsc9kqoo/bd1Hre7i8MR0AqkBeKIttPipNggrADjcXeMgM9laLw3rTo2A1fXOqRfD
         RhDwkyDO7XCTsYIQwsKFAqwvENsXIm0P+WgzrfeQ=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04CJ3snl125256
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 12 May 2020 14:03:54 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 12
 May 2020 14:03:54 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 12 May 2020 14:03:54 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04CJ3sNs008199;
        Tue, 12 May 2020 14:03:54 -0500
Subject: Re: [PATCH v25 00/16] Multicolor Framework v25
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20200504211344.13221-1-dmurphy@ti.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <eccbd882-b4f2-abc8-dddb-6c242d8ef0c0@ti.com>
Date:   Tue, 12 May 2020 13:54:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200504211344.13221-1-dmurphy@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 5/4/20 4:13 PM, Dan Murphy wrote:
> Hello
>
> This is the multi color LED framework.   This framework presents clustered
> colored LEDs into an array and allows the user space to adjust the brightness
> of the cluster using a single file write.  The individual colored LEDs
> intensities are controlled via a single file that is an array of LEDs

Please let me know if there are any issues with pulling this series in now

Dan

