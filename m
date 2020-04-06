Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B84C319F816
	for <lists+linux-leds@lfdr.de>; Mon,  6 Apr 2020 16:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728630AbgDFOja (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 6 Apr 2020 10:39:30 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:34456 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728566AbgDFOja (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 6 Apr 2020 10:39:30 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 036EdPGB060058;
        Mon, 6 Apr 2020 09:39:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1586183965;
        bh=Mv9f2/SpVcCjK44c4OSC4J10mXtBoBKAIa6WVzJmjN8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=aSOq2ThcWUWgAYsv82oD+RoDrRY77LUBG5h0Y8S2ARwnMOvEw0pstORLh7b61o8jM
         bwKsWMIfCPsF45RKqJynM/zD8iJ1vAM6zXFvvJ8UIqrmtSjE99Dzq5CRbgqdIlVRw8
         EOPupvkgYn/7XOPX1v0+NQNHP+wJwjOtuXQ+lm2U=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 036EdO15012727;
        Mon, 6 Apr 2020 09:39:24 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 6 Apr
 2020 09:39:24 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 6 Apr 2020 09:39:24 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 036EdOfs111481;
        Mon, 6 Apr 2020 09:39:24 -0500
Subject: Re: [PATCH v19 04/18] leds: multicolor: Introduce a multicolor class
 definition
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20200402204311.14998-1-dmurphy@ti.com>
 <20200402204311.14998-5-dmurphy@ti.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <6f8623ea-4f00-9521-e8d3-89d261c2a25e@ti.com>
Date:   Mon, 6 Apr 2020 09:33:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200402204311.14998-5-dmurphy@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 4/2/20 3:42 PM, Dan Murphy wrote:
> Introduce a multicolor class that groups colored LEDs
> within a LED node.
>
> The multi color class groups monochrome LEDs and allows controlling two
> aspects of the final combined color: hue and lightness. The former is
> controlled via <color>_intensity files and the latter is controlled
> via brightness file.
>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---

Still looking for comments and reviews from you on this specific patch 
and implementation

Dan

