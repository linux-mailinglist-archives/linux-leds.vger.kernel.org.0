Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4169972027D
	for <lists+linux-leds@lfdr.de>; Fri,  2 Jun 2023 15:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235397AbjFBNAj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 2 Jun 2023 09:00:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235253AbjFBNAi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 2 Jun 2023 09:00:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8675F1B1
        for <linux-leds@vger.kernel.org>; Fri,  2 Jun 2023 05:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685710792;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SYQbDxF8HJ9yczCBr5+GXXpcpnhVFKGmC8UmRB4rHvs=;
        b=GCJJ8rIE20Z+Yr7P6/3Ezht3iouMduFDsyGLFSDHOj7CihTUbLGuxOtfkcpD9ZDIIShz0A
        WsOhjLc9J3blMhIj95/k3Om9iNXuOkFeHswlH0OhPWNWUTkwk6MuBefomwNxGpYw95gS3m
        285ZRZCrMJf7m8NzkeTkrGPcqk7wCCE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-vHxnpBq4NySkZ7fEToCdnA-1; Fri, 02 Jun 2023 08:59:51 -0400
X-MC-Unique: vHxnpBq4NySkZ7fEToCdnA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-95847b4b4e7so157854566b.3
        for <linux-leds@vger.kernel.org>; Fri, 02 Jun 2023 05:59:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685710790; x=1688302790;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SYQbDxF8HJ9yczCBr5+GXXpcpnhVFKGmC8UmRB4rHvs=;
        b=VNvj5rQDqpsi6tbHsik3DyK2wnuxOBI8TZIah2H3T8EnqJN9BEO7YCo+5nKLEDei74
         RBsSBA5hLWuVoV1tGx8fJm0DRXd8VjKiXnDOeqYdDosNFLHuhfblQqw4+//RAYJqkdK1
         NHyVOTcEg1x7IKnC+aLJJXKq50lNqTvto08YkT4b6teqSXHOt3n1V0OFgrhQgSXyI5Ae
         tm+uaRCylEFvt4F9YijuM1B9DjUIXNTvF3+BzoQN5Ck2/2pJvQxjZ0LX1QT6d19iGxFH
         6ygKs+c59ag5FDVwvTtI9lNcBWHBOKe9SLnNYlXdcEcHHVtBwsdDmFMw4O5Y1tLi+gB7
         WaHw==
X-Gm-Message-State: AC+VfDwtOUANTdTtGdAE3almdYEu13DX+raHNA0tW8EeIe+uUOLMOjRx
        kUqi9Gru1qjbpeoamPUwnMToBQ94Yl0tSJmUEDes0mRUcfIBA/cPE1A4wy1kSUbHbIrgEAD9ScW
        tB4E/85PkGpd6bJfDpMLoxA==
X-Received: by 2002:a17:907:ea4:b0:953:37eb:7727 with SMTP id ho36-20020a1709070ea400b0095337eb7727mr11854253ejc.43.1685710790319;
        Fri, 02 Jun 2023 05:59:50 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6ekYZVdjYbzMccPVTK+2ktNkRpoStqU6upFUXJFP95B+/Om1SsDRzy0Z55fgVlHy1+zr/fVA==
X-Received: by 2002:a17:907:ea4:b0:953:37eb:7727 with SMTP id ho36-20020a1709070ea400b0095337eb7727mr11854230ejc.43.1685710790074;
        Fri, 02 Jun 2023 05:59:50 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id t15-20020a1709063e4f00b00965c529f103sm737493eji.86.2023.06.02.05.59.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jun 2023 05:59:49 -0700 (PDT)
Message-ID: <880b5b02-3c4c-c104-2eab-22664f13a252@redhat.com>
Date:   Fri, 2 Jun 2023 14:59:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] leds: cht-wcove: mark cht_wc_leds_brightness_get static
To:     Arnd Bergmann <arnd@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>, Yauhen Kharuzhy <jekhor@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230601213439.3398794-1-arnd@kernel.org>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230601213439.3398794-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Arnd,

On 6/1/23 23:34, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This was apparently made global but is not called from anywhere else:
> 
> drivers/leds/leds-cht-wcove.c:144:21: error: no previous prototype for 'cht_wc_leds_brightness_get' [-Werror=missing-prototypes]
> 
> Fixes: 047da762b9a93 ("leds: Add Intel Cherry Trail Whiskey Cove PMIC LED driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thank you for the patch. This is a duplicate fix with these
2 earlier submissions of the same fix:

https://lore.kernel.org/linux-leds/20230525183317.129232-1-hdegoede@redhat.com/
https://lore.kernel.org/linux-leds/20230530234748.3641630-1-trix@redhat.com/

Regards,

Hans





> ---
>  drivers/leds/leds-cht-wcove.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-cht-wcove.c b/drivers/leds/leds-cht-wcove.c
> index 0cfebee989107..0a5c30e5ed5d4 100644
> --- a/drivers/leds/leds-cht-wcove.c
> +++ b/drivers/leds/leds-cht-wcove.c
> @@ -141,7 +141,7 @@ static int cht_wc_leds_brightness_set(struct led_classdev *cdev,
>  	return ret;
>  }
>  
> -enum led_brightness cht_wc_leds_brightness_get(struct led_classdev *cdev)
> +static enum led_brightness cht_wc_leds_brightness_get(struct led_classdev *cdev)
>  {
>  	struct cht_wc_led *led = container_of(cdev, struct cht_wc_led, cdev);
>  	unsigned int val;

