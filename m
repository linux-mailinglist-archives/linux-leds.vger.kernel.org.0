Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4732229831
	for <lists+linux-leds@lfdr.de>; Wed, 22 Jul 2020 14:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbgGVM04 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 Jul 2020 08:26:56 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:36506 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726161AbgGVM0z (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Jul 2020 08:26:55 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06MCQbwV092506;
        Wed, 22 Jul 2020 07:26:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1595420797;
        bh=1wP4G7MooADMavVojqi6pALDQyDsRy6rEAIKe4yjHOw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=TEujInQmBuVFM2RzBDMoO3xqsQ9niVglkU6w2kUPo/V5RYpECbEiiAB7uCa4ruUHw
         QLFsl9wxfGBFwdur+f44FOPPN+WFbWIf6gnZQQpOUyaiZmiNIXgkUHBjZkjIlp/Ohr
         JAqPwpvRt5FXNMsVKzxB50IeGKd9c690yoQyHhaA=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06MCQbW4120900
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 22 Jul 2020 07:26:37 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 22
 Jul 2020 07:26:37 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 22 Jul 2020 07:26:37 -0500
Received: from [10.250.35.192] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06MCQbcQ024135;
        Wed, 22 Jul 2020 07:26:37 -0500
Subject: Re: [PATCH v31 03/12] leds: lp50xx: Add the LP50XX family of the RGB
 LED driver
To:     Pavel Machek <pavel@ucw.cz>
CC:     <jacek.anaszewski@gmail.com>, <robh@kernel.org>,
        <marek.behun@nic.cz>, <devicetree@vger.kernel.org>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200716182007.18389-1-dmurphy@ti.com>
 <20200716182007.18389-4-dmurphy@ti.com> <20200721210554.GC5966@amd>
 <c774fab9-124b-da2e-6f7c-614f34322942@ti.com> <20200722071055.GA8984@amd>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <c4e2b2db-483f-27ef-9869-3b0c56d0d8ba@ti.com>
Date:   Wed, 22 Jul 2020 07:26:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722071055.GA8984@amd>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 7/22/20 2:10 AM, Pavel Machek wrote:
> Hi!
>
>>>> +			ret = fwnode_property_read_u32_array(child,
>>>> +							     "reg",
>>>> +							     led_banks,
>>>> +							     ret);
>>> Move this to subfunction to reduce the indentation? (Or, just refactor
>>> it somehow).
>> Actually I can just put it all on the same line since the 80 character
>> requirement is relaxed.
> No.
>
> You have too long and too complex function, with too many blocks
> inside each other. Please fix it.

I will refactor

Dan


