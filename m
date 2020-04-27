Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16A1A1BAD9E
	for <lists+linux-leds@lfdr.de>; Mon, 27 Apr 2020 21:12:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbgD0TMp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Apr 2020 15:12:45 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:46452 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726364AbgD0TMp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Apr 2020 15:12:45 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03RJCfei126800;
        Mon, 27 Apr 2020 14:12:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588014761;
        bh=jRcgf5XdMQaZw49wtJzlSVjIEPTTwfQwyL6oaWcmdTg=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=H/lTZBMXaC/GFQF+1zgoRg0376pP1z2bN2dXM/lScy4ZRucmtVh2j1UpzcBnDMnby
         WAheAMkriNgXQYNk9WTGR0Z4+mPjKFnisHgellVlcDmqqpDTKnIVi60GVL8HdldcFr
         kcLZq7m5QBVoYs98kc6vFjWaW8z6hEg8hdG35M6U=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03RJCfCi052652
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 27 Apr 2020 14:12:41 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 27
 Apr 2020 14:12:41 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 27 Apr 2020 14:12:40 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03RJCeAC070544;
        Mon, 27 Apr 2020 14:12:40 -0500
Subject: Re: [PATCH v20 10/17] ARM: dts: ste-href: Add reg property to the
 LP5521 channel nodes
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
References: <20200423155524.13971-1-dmurphy@ti.com>
 <20200423155524.13971-11-dmurphy@ti.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <1d7bba6a-e038-c367-3d5a-ef5758616301@ti.com>
Date:   Mon, 27 Apr 2020 14:06:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200423155524.13971-11-dmurphy@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Linus

On 4/23/20 10:55 AM, Dan Murphy wrote:
> Add the reg property to each channel node.  This update is
> to accomodate the multicolor framework.  In addition to the
> accomodation this allows the LEDs to be placed on any channel
> and allow designs to skip channels as opposed to requiring
> sequential order.
>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> CC: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Pavel Machek <pavel@ucw.cz>

Pavel is asking for a review and if ok your ack

Dan

