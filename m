Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CF6C215748
	for <lists+linux-leds@lfdr.de>; Mon,  6 Jul 2020 14:32:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728953AbgGFMcT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 6 Jul 2020 08:32:19 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:60996 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728414AbgGFMcT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 6 Jul 2020 08:32:19 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 066CW0dl027058;
        Mon, 6 Jul 2020 07:32:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594038720;
        bh=zFAm7cgzQI8dO5tnF4ApS2fDkJ0/QyQP2WUW5IlgemM=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=xHayLRE3JMhI6U+jg58sUNv8RgyFElvL2pBV4IFewVr3n+hWPqBRQl0lyXumc9bbY
         QoNCC8EQmJEYEUtB4csoqZuLFB76uEc1iYAzBYWFb4kCpzR9XKH22M9yjgFxeoJ9kA
         2uXBRL9ro9kfulWHnwkgCg1IWlp2kKJgz6Gz6OHo=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 066CW0S9066434
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 6 Jul 2020 07:32:00 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 6 Jul
 2020 07:32:00 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 6 Jul 2020 07:31:59 -0500
Received: from [10.250.32.229] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 066CVx60070054;
        Mon, 6 Jul 2020 07:31:59 -0500
Subject: Re: [PATCH v29 00/16] Multicolor Framework v29
To:     Pavel Machek <pavel@ucw.cz>, <marek.behun@nic.cz>
CC:     <jacek.anaszewski@gmail.com>, <robh@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200622185919.2131-1-dmurphy@ti.com>
 <20200704124729.GA20088@amd>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <e25dd902-da3f-37ca-c9bc-f4ab42019281@ti.com>
Date:   Mon, 6 Jul 2020 07:31:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200704124729.GA20088@amd>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 7/4/20 7:47 AM, Pavel Machek wrote:
> Hi!
>
>> This is the multi color LED framework.   This framework presents clustered
>> colored LEDs into an array and allows the user space to adjust the brightness
>> of the cluster using a single file write.  The individual colored LEDs
>> intensities are controlled via a single file that is an array of LEDs
>>
>> Change to the LEDs Kconfig to fix dependencies on the LP55XX_COMMON.
>> Added update to the u8500_defconfig
> Marek, would you be willing to look over this series?
>
> Dan, can we please get it in the order
>
> 1) fixes first
>
> 2) changes needed for multicolor but not depending on dt acks
>
> 3) dt changes
>
> 4) rest?
>
> This is the order it should have been in the first place, and I'd like
> to get fixes applied, and perhaps some of the preparation.

This will depend on if there are comments.  If I have to push a v30 then 
I will reorder.

If not then there would be no reason to re-order these.

Dan


