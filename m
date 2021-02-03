Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B388430DBC9
	for <lists+linux-leds@lfdr.de>; Wed,  3 Feb 2021 14:51:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231740AbhBCNuo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 3 Feb 2021 08:50:44 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:38482 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230123AbhBCNun (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 3 Feb 2021 08:50:43 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 113Dnfnb065738;
        Wed, 3 Feb 2021 07:49:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1612360181;
        bh=j6icRAuTZgy1AtJAEQIOxn7n/y4lnVdH9Vjvn+YesGI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=mua55PK9ZobR4t0zc/U1M/HaDWdHiB+Qb9V4lUK27I2nYvf8s8B7mIFVt3I3r976i
         4PVA1oDLx3Qu87uOKefLoBg7AFYwspsoJA0dxpmlp098Ie96aoFI6Nq4Nrmv0aD5OJ
         afs2IlIHTCIGqnoL6GOFFwuL8FSc6MGnzS4LvidM=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 113DnfZN107665
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 3 Feb 2021 07:49:41 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 3 Feb
 2021 07:49:40 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 3 Feb 2021 07:49:41 -0600
Received: from [10.250.39.117] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 113DneOw033189;
        Wed, 3 Feb 2021 07:49:40 -0600
Subject: Re: [PATCH 2/2] leds: lp50xx: remove unused regulator
To:     Pavel Machek <pavel@ucw.cz>,
        Sven Schuchmann <schuchmann@schleissheimer.de>
CC:     Rob Herring <robh+dt@kernel.org>, <linux-leds@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20210203083408.2534-1-schuchmann@schleissheimer.de>
 <20210203090249.GA14154@amd>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <2e9dff78-7fde-404d-6fad-6aeedf1145d1@ti.com>
Date:   Wed, 3 Feb 2021 07:49:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210203090249.GA14154@amd>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 2/3/21 3:02 AM, Pavel Machek wrote:
> On Wed 2021-02-03 08:34:08, Sven Schuchmann wrote:
>> The regulator for vled-supply is unused in the driver.
>> It is just assigned from DT and disabled in lp50xx_remove.
>> So the code can be removed from the driver.
> Dan, what is going on here? Do we need to also enable the regulator,
> or is the removal correct thing to do?
>
I think it would be better to do an enable as opposed to removing the code.

This would be needed especially in applications that have to meet strict 
power management requirements.

Users may want to disable or enable the regulator during suspend/resume. 
Otherwise it would be considered always-on and the regulator does not 
need to be populated.

Dan

