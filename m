Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89CDF2837EE
	for <lists+linux-leds@lfdr.de>; Mon,  5 Oct 2020 16:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725936AbgJEOhz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 5 Oct 2020 10:37:55 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:43994 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbgJEOhz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 5 Oct 2020 10:37:55 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 095EbTRp105709;
        Mon, 5 Oct 2020 09:37:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1601908649;
        bh=p4FfZj0mn0or8Tgyw7W0xtaw4CxhBFYM5wKOOcC+2y4=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=vHjE6qtMOSWGxM6ElcmHv8bZc6NmAn4t0uIkidxW934MRLScpUO0wrcnXkFH0W85s
         cAwpR68Uz6hJnNPcJpI9bFqGUPIPOoN17Fomke0ddVebGIFccJax1HRfCpfGRK5gK6
         VfPkwzQEHh2tmvRhWokTmYq+Nf7k0I4WXlQcLGnY=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 095EbTUT105569
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 5 Oct 2020 09:37:29 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 5 Oct
 2020 09:37:28 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 5 Oct 2020 09:37:28 -0500
Received: from [10.250.71.177] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 095EbQvg080431;
        Mon, 5 Oct 2020 09:37:27 -0500
Subject: Re: [PATCH] leds: lm3697: Fix out-of-bound access
From:   Dan Murphy <dmurphy@ti.com>
To:     <ultracoolguy@tutanota.com>, Marek Behun <kabel@blackhole.sk>
CC:     Pavel <pavel@ucw.cz>, Linux Leds <linux-leds@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>
References: <MIiYgay--3-2@tutanota.com> <20201005141334.36d9441a@blackhole.sk>
 <MIt2NiS--3-2@tutanota.com> <3c5fce56-8604-a7d5-1017-8a075f67061e@ti.com>
Message-ID: <fb065309-e58c-134b-d19a-5c1a5daf24ac@ti.com>
Date:   Mon, 5 Oct 2020 09:37:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3c5fce56-8604-a7d5-1017-8a075f67061e@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

All

On 10/5/20 9:33 AM, Dan Murphy wrote:
> Marek
>
Sorry not Marek but Gabriel I misread the "To" field

Dan
