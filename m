Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 190A9EA1F4
	for <lists+linux-leds@lfdr.de>; Wed, 30 Oct 2019 17:44:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726806AbfJ3QoD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 30 Oct 2019 12:44:03 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:54522 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726435AbfJ3QoD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 30 Oct 2019 12:44:03 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9UGhvSv043741;
        Wed, 30 Oct 2019 11:43:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572453837;
        bh=JZA35ZR2OC9OCmKXZOq7DrvfhEUrhnzLjIn2Oloo+8A=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=TalvjQhrav520Ub5Vrvc1la0zH8zKDP4ssG0fJUrN9lU6XQjog4eWOoRQeh6bjAyK
         AjyTlbQqYsJV7pDtdmm2yKUlVxVXW19ZS1DoGxNHZ8jmQw7SIUykIIEG6pvEhhR7b3
         yKD6xRGL1hz354nIer00R4vv23XFcOCkb8qlXZ9c=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9UGhvDq006424
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 30 Oct 2019 11:43:57 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 30
 Oct 2019 11:43:44 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 30 Oct 2019 11:43:44 -0500
Received: from [10.250.35.43] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9UGhugx033777;
        Wed, 30 Oct 2019 11:43:56 -0500
Subject: Re: [PATCH v15 06/19] leds: lp50xx: Add the LP50XX family of the RGB
 LED driver
To:     kbuild test robot <lkp@intel.com>
CC:     <kbuild-all@lists.01.org>, <jacek.anaszewski@gmail.com>,
        <pavel@ucw.cz>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20191028183629.11779-7-dmurphy@ti.com>
 <201910302027.2hNdR993%lkp@intel.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <29321f74-8200-90cd-40f9-8f5bdb86e34e@ti.com>
Date:   Wed, 30 Oct 2019 11:43:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <201910302027.2hNdR993%lkp@intel.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 10/30/19 7:07 AM, kbuild test robot wrote:
> Hi Dan,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on j.anaszewski-leds/for-next]

You might want to get your tree to be the base now.

Dan


