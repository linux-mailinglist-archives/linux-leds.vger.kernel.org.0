Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B31025B3F
	for <lists+linux-leds@lfdr.de>; Wed, 22 May 2019 02:48:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727681AbfEVAs3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 21 May 2019 20:48:29 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:40272 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbfEVAs3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 21 May 2019 20:48:29 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4M0mP1U073270;
        Tue, 21 May 2019 19:48:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1558486106;
        bh=fNmTkfMm5SDrgxGzxSaL/WYP0tFyiJNOWMnwmAJXg9g=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=id2Dh4RdvFIpwxUSjMNjSZvxytIgwqQCaoGXM/1LDEoUp5MNB8gN2Oj1oQmonuVjq
         8u9CjO/oLCRfku3DOFRHO+chkzgEFHd/02tLCgui2ntODd09+ZqO5U11oPjPxcaaKz
         +pS/Lee+GPvNg3Aa/tQHiToUfsO2+uIjgGVSbxEA=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4M0mPxP018660
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 21 May 2019 19:48:25 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 21
 May 2019 19:48:25 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 21 May 2019 19:48:25 -0500
Received: from [10.250.90.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4M0mPfv008225;
        Tue, 21 May 2019 19:48:25 -0500
Subject: Re: [GIT PULL] Immutable branch between LEDs, MFD and REGULATOR
To:     Mark Brown <broonie@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <lee.jones@linaro.org>, <lgirdwood@gmail.com>
References: <20190521203038.31946-1-jacek.anaszewski@gmail.com>
 <20190521211504.GD1580@sirena.org.uk>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <151079e6-4ae3-3b95-2dc1-c57927b0425f@ti.com>
Date:   Tue, 21 May 2019 19:48:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190521211504.GD1580@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Mark

On 5/21/19 4:15 PM, Mark Brown wrote:
> On Tue, May 21, 2019 at 10:30:38PM +0200, Jacek Anaszewski wrote:
> 
>>       regulator: lm363x: Make the gpio register enable flexible
>>       regulator: lm363x: Add support for LM36274
> 
> Why have these been applied, I haven't reviewed them?  As far as I can
> tell they were sent before the merge window so I'd expect a resend at
> this point...
> 

You and Liam were cc'd on April 10,2019 for v2 of this patch set.  So I am not sure why the review was missed.

My apologies for not cc'ing you on v4 but there were no change since that time.
I cannot find v3 of this patchset.

The initial patches were sent on April 5, 2019

Dan
