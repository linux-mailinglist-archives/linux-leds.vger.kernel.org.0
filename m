Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65AB1197079
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2020 23:15:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728704AbgC2VPd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 29 Mar 2020 17:15:33 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:58904 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727591AbgC2VPd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 29 Mar 2020 17:15:33 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02TLFSvv009477;
        Sun, 29 Mar 2020 16:15:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585516528;
        bh=VDHI+u/3jcLeo7Mq1p0Hr9RPLGrkWC+gdwwXLAu5otQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=CHWU70aj90hjceNa4Uwb0OGwyTFRBaImDRQ4sV8hi5m0uJQfFXWtpKelcIj3sep3B
         JVnDzb2+y92DnEVuN9080nFSOL+S7zJQc5hXIXt4RvGwMs6CD5zHQcpNb94bh8Ex1f
         evEPTvYlUrmCg9vfg32TNcELIrFwDMzbAmp+d5t0=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02TLFSUR098090
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sun, 29 Mar 2020 16:15:28 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Sun, 29
 Mar 2020 16:15:28 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Sun, 29 Mar 2020 16:15:28 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02TLFSOl008105;
        Sun, 29 Mar 2020 16:15:28 -0500
Subject: Re: [PATCH v18 4/4] leds: multicolor: Introduce a multicolor class
 definition
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
References: <20200324181434.24721-1-dmurphy@ti.com>
 <20200324181434.24721-5-dmurphy@ti.com>
 <f43bf4c5-948d-b87f-9b95-98fcfeaae2fa@gmail.com>
 <9a707fe6-31c6-da9e-9372-51ca21bf3c88@ti.com>
 <1263c2f9-3cb3-f919-cce8-53201d64e121@gmail.com>
 <0e782f2d-2968-50c0-bf34-7ee781014ef8@ti.com>
 <ea7915a1-91ea-43d5-2e96-99d1ecc49875@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <0db08bd0-ae6f-049a-7970-cbaf2b1654e3@ti.com>
Date:   Sun, 29 Mar 2020 16:09:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <ea7915a1-91ea-43d5-2e96-99d1ecc49875@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 3/29/20 1:43 PM, Jacek Anaszewski wrote:
> Dan,
>
> On 3/29/20 5:14 PM, Dan Murphy wrote:
<snip>
>
>> Dan
>>
I will wait to hear from Pavel on this patchset since the array 
definition was something he was asking for.

Need to make sure this was his intent on wanting the array vs the sysfs 
interfaces otherwise the changes maybe futile in nature.

Dan

