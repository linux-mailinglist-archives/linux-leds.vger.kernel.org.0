Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A30A536159
	for <lists+linux-leds@lfdr.de>; Wed,  5 Jun 2019 18:32:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728771AbfFEQcJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 5 Jun 2019 12:32:09 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:60800 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728581AbfFEQcJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 5 Jun 2019 12:32:09 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x55GW4UZ023032;
        Wed, 5 Jun 2019 11:32:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559752324;
        bh=qIDUYTxE6wv44Y20SI9fIey5LVY7ECHQwKd7D9Y/+m0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=wq8tGL5n45RFAD1NADQqY/YSJnLPPUvSZBkclCZRk12mcNMFoPh6+SvXFYcBFIvgk
         t4If8qUyiWtxCUVb655m1Fu5sPrymI2XeLclwINtRWaMzo12hFeTbv/27R0or646l0
         qus4XywF9srz3/+UfAp3BeSCjsOzDFs1wu1UPzHE=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x55GW3eL078024
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 5 Jun 2019 11:32:04 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 5 Jun
 2019 11:32:03 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 5 Jun 2019 11:32:03 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x55GW2gX094600;
        Wed, 5 Jun 2019 11:32:03 -0500
Subject: Re: [PATCH v5 1/6] regulator: lm363x: Make the gpio register enable
 flexible
To:     Mark Brown <broonie@kernel.org>
CC:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>,
        <lgirdwood@gmail.com>, <lee.jones@linaro.org>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190604174345.14841-1-dmurphy@ti.com>
 <20190604174345.14841-2-dmurphy@ti.com> <20190605100132.GL2456@sirena.org.uk>
 <7ba7a633-1a39-adcc-e942-12c0eb7c3b16@ti.com>
 <054c3715-e85f-e052-faf1-057bf3a67d45@ti.com>
 <20190605163120.GR2456@sirena.org.uk>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <c01c0177-6f28-dc2a-bae7-a5d18c30ce5d@ti.com>
Date:   Wed, 5 Jun 2019 11:32:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190605163120.GR2456@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Mark

On 6/5/19 11:31 AM, Mark Brown wrote:
> On Wed, Jun 05, 2019 at 07:47:50AM -0500, Dan Murphy wrote:
>> On 6/5/19 7:02 AM, Dan Murphy wrote:
>>> I can squash patch 1 into 4.
>>> Also not sure what you mean by new validation.
>> Disregard I understand.  The patch is missing the validation code.
> Ah, some git add issues I guess :)  Squashing would help but it's not
> essential I think.


More like PEBKAC on this one


Dan

