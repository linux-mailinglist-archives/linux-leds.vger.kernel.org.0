Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1787712F9F4
	for <lists+linux-leds@lfdr.de>; Fri,  3 Jan 2020 16:47:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727729AbgACPrI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 3 Jan 2020 10:47:08 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:43510 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727539AbgACPrI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 3 Jan 2020 10:47:08 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 003Fl48L098132;
        Fri, 3 Jan 2020 09:47:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1578066424;
        bh=IzGspcIkDXJBcCzRYOLRM97rZAxVKQLhqmXvzyl7N5M=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=RTfX/JWVa4gfsumx0pJ+ssxbF9xN5KMtMjwsQnDrPee/btTqdiNliUw7GzVF203fr
         yIis28Y4xX2pGOi+uAZ40tnIt5oC8ZwlF8yzVWYs2Pe7Nzom3uXi58wmvoC1639LQG
         5mN3QTvI6ESfqjSftnhnOBs5jPX6kYLm7ezlwJSc=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 003Fl46L034139
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 3 Jan 2020 09:47:04 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 3 Jan
 2020 09:47:03 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 3 Jan 2020 09:47:04 -0600
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 003Fl39R009112;
        Fri, 3 Jan 2020 09:47:03 -0600
Subject: Re: [PATCH v17 12/19] leds: lp55xx: Convert LED class registration to
 devm_*
To:     Pavel Machek <pavel@ucw.cz>
CC:     <jacek.anaszewski@gmail.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20191114133023.32185-1-dmurphy@ti.com>
 <20191114133023.32185-13-dmurphy@ti.com> <20191222183014.GD23369@amd>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <7cdc1a0d-4a66-a248-6a6f-d05a5c7eda2e@ti.com>
Date:   Fri, 3 Jan 2020 09:44:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191222183014.GD23369@amd>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 12/22/19 12:30 PM, Pavel Machek wrote:
> On Thu 2019-11-14 07:30:16, Dan Murphy wrote:
>> Convert the LED class registration calls to the LED devm_*
>> registration calls.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> Nothing obviously wrong here. Was it tested?
>
> Acked-by: Pavel Machek <pavel@ucw.cz>
>
> Best regards,
> 							Pavel

Was there a specific test you are looking for me to perform besides 
basic testing?

Dan

