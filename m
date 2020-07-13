Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EC7321D609
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2020 14:36:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729543AbgGMMgd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 13 Jul 2020 08:36:33 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:49088 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729494AbgGMMgd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 13 Jul 2020 08:36:33 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06DCaGMG079966;
        Mon, 13 Jul 2020 07:36:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594643776;
        bh=VGBP2fIvmzT/XXdWJZL2v9UPK0oBAiOObCttmYvr9e8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Dy7wxJFOQ9y+4BaB9nvQMW+g6oR4tUrvYcpjjyCuNcBsLexBQPbPHss1Q75DC9CoO
         KlH2MIa9boqTorbzui0f8DIRCo7RSowGVwxmQbzAh1/+f/tp/WmrN8/V30lXSa2EI3
         YAISUwHmIw+2VoDso8hOZmmqx5syXIybr+vUNKxo=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06DCaGsG013820
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 13 Jul 2020 07:36:16 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 13
 Jul 2020 07:36:15 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 13 Jul 2020 07:36:15 -0500
Received: from [10.250.32.229] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06DCaFWw021000;
        Mon, 13 Jul 2020 07:36:15 -0500
Subject: Re: [PATCH v29 05/16] leds: lp50xx: Add the LP50XX family of the RGB
 LED driver
To:     Marek Behun <marek.behun@nic.cz>
CC:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200622185919.2131-1-dmurphy@ti.com>
 <20200622185919.2131-6-dmurphy@ti.com> <20200712192103.5e24ed2a@nic.cz>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <47d846d9-9a49-02b1-ce59-d0cc157c268a@ti.com>
Date:   Mon, 13 Jul 2020 07:36:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200712192103.5e24ed2a@nic.cz>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Marek

Thanks for the review

On 7/12/20 12:21 PM, Marek Behun wrote:
> Hi Dan, one bug in this driver, see below.

This is not really a bug.  It is an enhancement to the driver.

I will update it since I have to touch the series anyway.

Dan

