Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BE5BE0938
	for <lists+linux-leds@lfdr.de>; Tue, 22 Oct 2019 18:38:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731727AbfJVQii (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 22 Oct 2019 12:38:38 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:35486 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732748AbfJVQii (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 22 Oct 2019 12:38:38 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9MGcRGx065024;
        Tue, 22 Oct 2019 11:38:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571762307;
        bh=Fy+OBX4P0UBiFTv4J1DsNAxpQNlNFk7V+smtkmjb3Ao=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=bXbBkvHLAVYQZi/bHMOuIU7X+yXZdag91kcFM1wBxo2uH+V9l4FNDydL5FuVwShQ2
         xdUbx3z718sV0Xb7edEIne6LvowyDE8mmh5pvh+WwKXvRvmbW0XT+WzVIxL/wHapXT
         DMFa2PNsRHm94bGl9xt5RxXDzsd5PO7pKRjDJhHo=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9MGcC5j104266
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 22 Oct 2019 11:38:12 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 22
 Oct 2019 11:38:02 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 22 Oct 2019 11:38:12 -0500
Received: from [10.250.35.43] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9MGbu4x050727;
        Tue, 22 Oct 2019 11:37:56 -0500
Subject: Re: [PATCH v14 13/19] leds: lp55xx: Add multicolor framework support
 to lp55xx
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20191018122521.6757-1-dmurphy@ti.com>
 <20191018122521.6757-14-dmurphy@ti.com>
 <a24832d9-1c3d-b3ea-4326-2ef4937d5a59@gmail.com>
 <c9a704d4-b411-59f1-02bf-3ea7b219c4b4@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <e1b84d15-d670-9393-aa65-85120e522a35@ti.com>
Date:   Tue, 22 Oct 2019 11:37:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <c9a704d4-b411-59f1-02bf-3ea7b219c4b4@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 10/18/19 4:56 PM, Jacek Anaszewski wrote:
> On 10/18/19 11:48 PM, Jacek Anaszewski wrote:
>> Dan,
> +		ret = lp5xx_parse_channel_child(child, cfg, i);
>> I went into details of this parsing and finally came up with
>> the code which is a bit greater in size, but IMHO cleaner.
>> Note changes in variable naming. It is not even compile-tested.
>>
>> static int lp55xx_parse_common_child(struct device_node *np,
>>                                      struct lp55xx_led_config *cfg,
>>                                      int led_number, int *chan_nr)
>> {
>>          int ret;
>>
>>          of_property_read_string(np, "chan-name",
>>                                  &cfg[led_number].name);
>>          of_property_read_u8(np, "led-cur",
>>                              &cfg[led_number].led_current);
>>          of_property_read_u8(np, "max-cur",
>>                              &cfg[led_number].max_current);
>>
>>          ret = of_property_read_u32(np, "reg", chan_nr);
>>          if (ret)
>>                  return ret;
>>
>>          if (chan_nr < 0 || chan_nr > cfg->max_chan_nr) /* side note: new
>> max_chan_nr property needed in cfg */
>>                  return -EINVAL;
>>
>>          return 0;
>> }
>>
>> static int lp55xx_parse_mutli_led_child(struct device_node *np,
>>                                          struct lp55xx_led_config *cfg,
>>                                          int child_number,
>>                                          int color_number)
>> {
>>          int chan_nr, color_id;
>>
>>          ret = lp55xx_parse_common_child(child, cfg, child_number,
>> color_number,
>>                                          &chan_nr);
>>          if (ret)
>>                  return ret;
>>
>>          ret = of_property_read_u32(child, "color", &color_id);
>>          if (ret)
>>                 return ret;
>>
>>          cfg[child_number].color_components[color_number].color_id =
>> color_id;
>>          cfg[child_number].color_components[color_number].output_num =
>> chan_nr;
>>          set_bit(color_id, &cfg[child_number].available_colors);
>>
>>          return 0;
>> }
>>
>> staitc int lp55xx_parse_mutli_led(struct device_node *np,
>>                                    struct lp55xx_led_config *cfg,
>>                                    int child_number)
>> {
>>          struct device_node *child;
>>          int num_colors = 0, i = 0;
> s/, i = 0//
>
>>          for_each_child_of_node(np, child) {
>>                  ret = lp55xx_parse_mutli_led_child(child, cfg, num_colors,
>>                                                     child_number, i))
> Replace above call with below:
>
> ret = lp55xx_parse_mutli_led_child(child, cfg, child_number, num_colors);
>
I applied your DT parser patch from the v13 series.  Which eliminates 
this comment correct?

Dan
