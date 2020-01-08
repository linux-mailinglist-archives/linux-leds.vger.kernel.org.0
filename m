Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9453E134447
	for <lists+linux-leds@lfdr.de>; Wed,  8 Jan 2020 14:51:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727787AbgAHNvH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 8 Jan 2020 08:51:07 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:34560 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727158AbgAHNvH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 8 Jan 2020 08:51:07 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 008Dox0C115657;
        Wed, 8 Jan 2020 07:50:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1578491459;
        bh=ZQvcg0rastnxK0vE7baWU38XIonrEiIs4ECCAsgMIA4=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=X+2mzgmO+zvrZV0G+H/1km2xl+vivf3Kco49RirE/4dW9yQ8/6X0le3VTY2qY1Twv
         Dab3pu5i7da1it+II70cY4Cq9d9ZFWZgnxIlwfcJwdSqjaHUBc9HepltQv1W+3GAe5
         vUKqiZk3NKIej3avdtcJFgnD7vP6y2Q+6VLudz0k=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 008Dox6N125933
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 8 Jan 2020 07:50:59 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 8 Jan
 2020 07:50:59 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 8 Jan 2020 07:50:59 -0600
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 008Dowmn016932;
        Wed, 8 Jan 2020 07:50:58 -0600
Subject: Re: [PATCH v17 00/19] Multicolor Framework
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20191114133023.32185-1-dmurphy@ti.com>
 <efdfcf1f-50b2-314f-3d46-93369229109a@ti.com>
Message-ID: <63fd7446-d051-5ef2-3901-dbc290b158e0@ti.com>
Date:   Wed, 8 Jan 2020 07:48:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <efdfcf1f-50b2-314f-3d46-93369229109a@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello

Do you have a time frame in applying this patch set?

Dan

On 12/18/19 8:45 AM, Dan Murphy wrote:
> Hello
>
> Bump for application to leds-next
>
> Dan
>
> On 11/14/19 7:30 AM, Dan Murphy wrote:
>> Hello
>>
