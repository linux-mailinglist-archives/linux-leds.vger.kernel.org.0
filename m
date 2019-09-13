Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AFF3B212B
	for <lists+linux-leds@lfdr.de>; Fri, 13 Sep 2019 15:49:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388562AbfIMNgB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 13 Sep 2019 09:36:01 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:56604 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388524AbfIMNgB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 13 Sep 2019 09:36:01 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8DDZqNj077964;
        Fri, 13 Sep 2019 08:35:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568381752;
        bh=htVbkUE240GYwYvt9YcmrcCrIWYrUxsTa+iR9Z8PAAI=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=tQogXbicE7w8fCgwvj7ZUL+W7xm7wVooGXxYDsWMp2c61OdVkP8+kD304CnCU19O5
         6rZUFKtW/ULXi1KjygmR7kQLncdlPEWNsfOXXmpHgrsJKfMBm+2Ed0FRsBp+HzTXz8
         GMYOYKTvqZo0M3sYQyAM4NW6lwTByE5/1j+FlErQ=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8DDZqUq014404
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 13 Sep 2019 08:35:52 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 13
 Sep 2019 08:35:51 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 13 Sep 2019 08:35:51 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8DDZqZZ064599;
        Fri, 13 Sep 2019 08:35:52 -0500
Subject: Re: v7 EL15203000
To:     Oleh Kravchenko <oleg@kaa.org.ua>, <devicetree@vger.kernel.org>,
        <linux-leds@vger.kernel.org>, <jacek.anaszewski@gmail.com>,
        <pavel@ucw.cz>
References: <20190912221115.23595-1-oleg@kaa.org.ua>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <3ea2514d-1e9a-8cf0-0ff4-a4430e46cbdb@ti.com>
Date:   Fri, 13 Sep 2019 08:36:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190912221115.23595-1-oleg@kaa.org.ua>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Oleh

On 9/12/19 5:11 PM, Oleh Kravchenko wrote:
> [PATCH v8 1/2] dt-bindings: Add docs for EL15203000
> [PATCH v8 2/2] leds: add LED driver for EL15203000 board

$subject of cover letter should be v8

Dan

> Changes what was made:
> - removed odd spaces;
> - use only one return in el15203000_pattern_set_P();
> - reduce returns in el15203000_probe_dt();
> - remove ret variable from el15203000_probe().
>
