Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4515935D2D
	for <lists+linux-leds@lfdr.de>; Wed,  5 Jun 2019 14:47:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727612AbfFEMr5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 5 Jun 2019 08:47:57 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:34886 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727600AbfFEMr5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 5 Jun 2019 08:47:57 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x55Clplb096622;
        Wed, 5 Jun 2019 07:47:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559738871;
        bh=m+aTF9fbF05MfZ/qcMNkOezHIu4xmi21OJYFRSBBLKc=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=Dm/RdGMRwboWg+VwyGsaPcYwqQ7UZbssHe5yqhXEv6jkD0W+NtQWeFOZwcEPRr54n
         px/Au8zvMFOuvpTxsS07qgCvtgEd9Q88bqYaRlJh2dYBf7l3dbWVjnmVraWDIZDHmu
         VTKTM3c4dGZOac8qQ0QAzfZqRgWHcQKslAoIMGyc=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x55ClpxQ064739
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 5 Jun 2019 07:47:51 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 5 Jun
 2019 07:47:51 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 5 Jun 2019 07:47:51 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x55Clop3086390;
        Wed, 5 Jun 2019 07:47:50 -0500
Subject: Re: [PATCH v5 1/6] regulator: lm363x: Make the gpio register enable
 flexible
From:   Dan Murphy <dmurphy@ti.com>
To:     Mark Brown <broonie@kernel.org>
CC:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>,
        <lgirdwood@gmail.com>, <lee.jones@linaro.org>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190604174345.14841-1-dmurphy@ti.com>
 <20190604174345.14841-2-dmurphy@ti.com> <20190605100132.GL2456@sirena.org.uk>
 <7ba7a633-1a39-adcc-e942-12c0eb7c3b16@ti.com>
Message-ID: <054c3715-e85f-e052-faf1-057bf3a67d45@ti.com>
Date:   Wed, 5 Jun 2019 07:47:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <7ba7a633-1a39-adcc-e942-12c0eb7c3b16@ti.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Mark

On 6/5/19 7:02 AM, Dan Murphy wrote:
> Mark
>
> On 6/5/19 5:01 AM, Mark Brown wrote:
>> On Tue, Jun 04, 2019 at 12:43:40PM -0500, Dan Murphy wrote:
>>> The use of and enablement of the GPIO can be used across devices.
>>> Use the enable_reg in the regulator descriptor for the register to
>>> write.
>>>
>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>>> ---
>>>
>>> v5 - No changes to the patch changes requested in this patch were 
>>> done in
>>> patch 4 of this series - 
>>> https://lore.kernel.org/patchwork/patch/1077408/
>> I was expecting this patch to just be completely dropped?  It looks like
>> the end result is very similar, we're still using enable_reg to get the
>> register and I don't see new validation added in patch 4.
>
> I can squash patch 1 into 4.
>
> Also not sure what you mean by new validation.
>
Disregard I understand.  The patch is missing the validation code.


> Please comment on patch 4 to what you are looking for
>
> Dan
>
