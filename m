Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28AAD1EEEA2
	for <lists+linux-leds@lfdr.de>; Fri,  5 Jun 2020 02:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726021AbgFEAIN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 4 Jun 2020 20:08:13 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:47892 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725986AbgFEAIM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 4 Jun 2020 20:08:12 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 055087U2054849;
        Thu, 4 Jun 2020 19:08:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1591315687;
        bh=++12NsWfNAE1WdHSBzqK4FR7Dn3ydGwcqrGJYz2e2pI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=ACbAsT+1VauWyX7TcES5XowHiveifLsXSMcDqCckGEUYvxmW2pjsrqvGLz0ePXL5s
         Kc3qm4r7syRvoWJ+98LRzfQIK26v7ukfAZp184uSMYt5zULQWJfxyigPN9qxXfImcX
         LOgN3N9ClRBl8f/BvNBMdQYtTCDfUMFsukqyehy0=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 055087F3015042
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 4 Jun 2020 19:08:07 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 4 Jun
 2020 19:08:07 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 4 Jun 2020 19:08:07 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 055086gQ023905;
        Thu, 4 Jun 2020 19:08:07 -0500
Subject: Re: [PATCH v26 06/15] dt-bindings: leds: Convert leds-lp55xx to yaml
To:     Rob Herring <robh@kernel.org>
CC:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>,
        <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20200604120504.32425-1-dmurphy@ti.com>
 <20200604120504.32425-7-dmurphy@ti.com> <20200604230456.GA6520@bogus>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <f8d648cc-9ff6-33a7-6da9-300a6b5b7d1c@ti.com>
Date:   Thu, 4 Jun 2020 19:08:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200604230456.GA6520@bogus>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Rob

On 6/4/20 6:04 PM, Rob Herring wrote:
> On Thu, Jun 04, 2020 at 07:04:55AM -0500, Dan Murphy wrote:
>> Convert the leds-lp55xx.txt to yaml binding.

I will fix all your comments.

But why does your BOT have checkpatch warnings?

https://gitlab.com/robherring/linux-dt-review/-/jobs/581282098/artifacts/file/checkpatch-1303471.log

Is this because checkpatch thinks the .txt file is invalid?

Dan

