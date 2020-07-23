Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFFCD22B0AD
	for <lists+linux-leds@lfdr.de>; Thu, 23 Jul 2020 15:40:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728265AbgGWNk1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Jul 2020 09:40:27 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:46922 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728066AbgGWNk0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Jul 2020 09:40:26 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06NDeAFl097701;
        Thu, 23 Jul 2020 08:40:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1595511610;
        bh=93PAb3rdnNuCAbhj8PCtfgeay7I68iTO1Kagpn+eA/c=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=MTdYypGtzeCv6gnVkGQ1muYkKbnJCJ/2s7TR61dHhOaw5NSwSZ1+l7rC1+4jCVi2W
         rYWQ7TMsQe++aTZt/fO0cbhENkNvED17gBU8p0w5QSNrHhn3lONMWtIKFJASJp2dJ/
         4VyVBqrleWuACZfpoX49chFej5/PNuAyWNYfNW5o=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06NDeA2t030807
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 23 Jul 2020 08:40:10 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 23
 Jul 2020 08:40:09 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 23 Jul 2020 08:40:09 -0500
Received: from [10.250.35.192] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06NDe97U080447;
        Thu, 23 Jul 2020 08:40:09 -0500
Subject: Re: [PATCH] leds: add orange color
To:     =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
        <linux-leds@vger.kernel.org>
CC:     Pavel Machek <pavel@ucw.cz>, <jacek.anaszewski@gmail.com>
References: <20200723125751.4045-1-marek.behun@nic.cz>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <1a8a489b-95e0-58a6-5454-1c45a7ef156c@ti.com>
Date:   Thu, 23 Jul 2020 08:40:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200723125751.4045-1-marek.behun@nic.cz>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Marek

On 7/23/20 7:57 AM, Marek Behún wrote:
> Many network devices have LEDs with green and orange color, instead of
> green and yellow.

Can't we use amber?

Dan

