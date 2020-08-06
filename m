Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C460923DD06
	for <lists+linux-leds@lfdr.de>; Thu,  6 Aug 2020 18:59:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729079AbgHFQ7Y (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 6 Aug 2020 12:59:24 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:56840 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728970AbgHFQ7X (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 6 Aug 2020 12:59:23 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 076F15Ev107938;
        Thu, 6 Aug 2020 10:01:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1596726065;
        bh=SsDht611ujdkNQFc6BFSfYMna5LmuK9AurW2tYiBVyU=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=IydTJGkvBiT7VaX6EBJOe1Z1CzhZiR6dHukbm9n8mlGN/ogWpgM04AcWOGWWqilRV
         aVoxk2TSG5yjqHjWygESa/KQksSSpl/nyd+5j9Y0f+uKkuyeyay94f0K+0S0ahvi4w
         a3NIvRw6BmqgBwxkkKa4qNyqzlfEDuB14CS9L//w=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 076F15G0015172
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 6 Aug 2020 10:01:05 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 6 Aug
 2020 10:01:05 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 6 Aug 2020 10:01:05 -0500
Received: from [10.250.38.37] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 076F14J2050834;
        Thu, 6 Aug 2020 10:01:04 -0500
Subject: Re: [PATCH 1/2] leds: is31fl319x: Add sdb pin and generate a 5ms low
 pulse when startup
To:     Grant Feng <von81@163.com>, <jacek.anaszewski@gmail.com>,
        <pavel@ucw.cz>, <robh+dt@kernel.org>, <linux-leds@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20200806062130.25187-1-von81@163.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <7c828160-bef6-45b5-60d1-85c6074953c4@ti.com>
Date:   Thu, 6 Aug 2020 10:00:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200806062130.25187-1-von81@163.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


