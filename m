Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3010526FBC8
	for <lists+linux-leds@lfdr.de>; Fri, 18 Sep 2020 13:47:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbgIRLrh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 18 Sep 2020 07:47:37 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:46050 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbgIRLrh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 18 Sep 2020 07:47:37 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08IBlLvI055055;
        Fri, 18 Sep 2020 06:47:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1600429641;
        bh=r7lWb4Yfy9eEgjb/19AC0jLQoO5CNUwNrKO9yWFpfZw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=hem+CTSTR2BRTa3mSxtuac+ZR+kz2UsN+cIlw5uOf5d6rClzPd0/XqdRd7TUZzcnv
         wiPIAhuS+yFakVv8j4MRL5VFK5Bp5qF5yo2oubKt1SOM7bbxrSUkonlF//g8UEcINj
         +k0ObhLBxAtCae3fPBLfmWwoZ2BC4FOO85MQSfBA=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08IBlKeM028774
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 18 Sep 2020 06:47:21 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 18
 Sep 2020 06:47:20 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 18 Sep 2020 06:47:20 -0500
Received: from [10.250.35.164] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08IBlKPk128830;
        Fri, 18 Sep 2020 06:47:20 -0500
Subject: Re: [PATCH leds v2 15/50] leds: lm3697: cosmetic change: use helper
 variable, reverse christmas tree
To:     =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
        <linux-leds@vger.kernel.org>
CC:     Pavel Machek <pavel@ucw.cz>,
        =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megous@megous.com>,
        <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
References: <20200917223338.14164-1-marek.behun@nic.cz>
 <20200917223338.14164-16-marek.behun@nic.cz>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <7d91fc92-0b56-afd6-a948-c25be9bfed38@ti.com>
Date:   Fri, 18 Sep 2020 06:47:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200917223338.14164-16-marek.behun@nic.cz>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Marek

On 9/17/20 5:33 PM, Marek Behún wrote:
> Use helper variable dev instead of always writing &client->dev, or
> &priv->client->dev, or even &led->priv->client->dev.
>
> With one more line moved reverse christmas tree is also achieved.

Reviewed-by: Dan Murphy <dmurphy@ti.com>


