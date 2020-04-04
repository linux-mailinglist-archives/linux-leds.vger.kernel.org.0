Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92F2919E54A
	for <lists+linux-leds@lfdr.de>; Sat,  4 Apr 2020 16:02:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726396AbgDDOCM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 4 Apr 2020 10:02:12 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:45554 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725837AbgDDOCM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 4 Apr 2020 10:02:12 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 034E1r7f049708;
        Sat, 4 Apr 2020 09:01:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1586008913;
        bh=Dif16M2cO1ckD5/rwlaRsCOadJgKCZOjz8Bt7Jkd3uw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=BFhdntI7uzitDbhQCFRPPUn9U/G5p+zKFLscJPYdE+MWtRcJieVrD4aIp/vgVYbAS
         voWnUp3c8Emft0JVsRVlYBtXd9wWZ4UestPt575m4cXRUVB23WWxisxVKYbVEq9gsc
         oYje+ZUFiOXon1ZzarAUt0I9bule1JGyVJTHqivk=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 034E1rpM068279
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sat, 4 Apr 2020 09:01:53 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Sat, 4 Apr
 2020 09:01:53 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Sat, 4 Apr 2020 09:01:53 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 034E1rHo043439;
        Sat, 4 Apr 2020 09:01:53 -0500
Subject: Re: [PATCH v2 2/2] leds: add sgm3140 driver
To:     Luca Weiss <luca@z3ntu.xyz>, <linux-leds@vger.kernel.org>
CC:     Heiko Stuebner <heiko@sntech.de>, Icenowy Zheng <icenowy@aosc.io>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <~postmarketos/upstreaming@lists.sr.ht>
References: <20200330194757.2645388-1-luca@z3ntu.xyz>
 <20200330194757.2645388-3-luca@z3ntu.xyz>
 <e29c3fee-068d-c3d7-a0e6-6877a616b3fa@ti.com> <5847770.lOV4Wx5bFT@g550jk>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <abecc052-e432-fe4d-b2dd-eb3a35b754fb@ti.com>
Date:   Sat, 4 Apr 2020 08:56:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <5847770.lOV4Wx5bFT@g550jk>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Luca

On 4/4/20 4:36 AM, Luca Weiss wrote:
> + fled_cdev, NULL, 
<snip>
>>> +					   &v4l2_sd_cfg);
>>> +	if (IS_ERR(priv->v4l2_flash)) {
>>> +		ret = PTR_ERR(priv->v4l2_flash);
>>> +		goto err;
>> Not sure why this is here you are not in a for loop and this will fall
>> through anyway to the err label.
>>
> I kept the goto in, in case more code is added below that statement so the
> author doesn't forget that this error needs to be handled.
> If wanted I can remove it of course.
>
I am ok with all the reasoning in the previous comments.  This one I 
would say just fall through to out.

If there is other code added after this then it can be added in.

Dan

