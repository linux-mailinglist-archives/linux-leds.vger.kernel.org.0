Return-Path: <linux-leds+bounces-7673-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UP/uKmwG2GmfWQgAu9opvQ
	(envelope-from <linux-leds+bounces-7673-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 09 Apr 2026 22:05:00 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 244033CF32C
	for <lists+linux-leds@lfdr.de>; Thu, 09 Apr 2026 22:05:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0F0C0301D4CB
	for <lists+linux-leds@lfdr.de>; Thu,  9 Apr 2026 20:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F72130AABE;
	Thu,  9 Apr 2026 20:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="abkonLHk"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EB912CD8B
	for <linux-leds@vger.kernel.org>; Thu,  9 Apr 2026 20:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765093; cv=none; b=Vp12l/Yz6bwxcpKr999gSAnlw8sgjIJwszTiasiwsAy5n9YYYWlkOchJmTtzv891SkNXBYHeRwK8T2ewSz4PCL68629VcU9tOE100EGT9aTuZI35K08ECr7j100eJdZq47DEHzGseP25goLbw0H8ahYssMIJmahQaFO4CWAk3RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765093; c=relaxed/simple;
	bh=oyfrRqRvZFeyIVwNrH6Z6dQPaitfntwHluGT/Ji3iNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UtqlE0Zu4937Hu0emCNVFQ1swBhhhxXBrQJ4ItJ1CX3YA09IJpoUYV4kE6oyV7B4M0izyFcoLdCCAHg9gdwxkDTzqNxLCyyQRUjQfGtX0Hw+NdJCIjL1/Nq9QwLEQRM0j0enC797Z3UT+STeTDH9G0FZNv410kgAShCf7XCvsBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=abkonLHk; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-66bd3d05e03so1512944a12.2
        for <linux-leds@vger.kernel.org>; Thu, 09 Apr 2026 13:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775765090; x=1776369890; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LqS5Pf7YsvspLFyoG0lx1qkP9YEtML5bQ5wp6Ju/2Tc=;
        b=abkonLHk1XDsvPUSD0TB6KNlfONxqGtUPmebaneZgLcwaftqUxUNwC1JGtjyC4ufnP
         jWIkOxhddhaDhs//r2va+3Tlec9CRfGpNYPi10Qg6B3ftauqKKJx1NnHP1PDvuouhnFN
         QHIUdQwqla3sm6LNHZG2NJ/6yxsi5yuFGHCjqcEopwKeOu3g0WLx987nk4jHr6lvRrYo
         m+8V/BU9VV6PwBV83gHN2jnjFWEfQKZ9YCInrqWIVuN0Q+1dCtuuUc5bvj3Btbj3k3zL
         YBh3sg1i8QM7ttjzeiejt+8249vqA64W1L6LalUmKJFJxNiYAsE+VaVy8Bbc6lNOpZFD
         xorQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775765090; x=1776369890;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LqS5Pf7YsvspLFyoG0lx1qkP9YEtML5bQ5wp6Ju/2Tc=;
        b=RwDnaVCqg9R29RzTPJ78pdkSfDKKHBX8CTIH2+YvymEO3T5De7O1cqYGlF/7feUFo4
         J1DNkQHZX9CK3jfS6fbCRvi5JEm5qxlBfU73sVIDfEmmqjneNDmrCXMX/O3/jEqMu9Vs
         U5/2AMDrvnjpphKtkgAyIK8WQdtkYsTXw4pl1sGDXSire2EgesUpREh5b1oHFCbkeShZ
         KouBIcvkNQOKuly81PuwPInbtttqy+zslPJnDeHMDYklI0oyKY7TVGFkm42VXMDFicyo
         xFxYOYnnyAfyMY3YS/baVZkRP/0ayVk/yqxYXEH18chUvQrKooLgA1tsT5XbkiXowYNO
         0NOw==
X-Forwarded-Encrypted: i=1; AJvYcCV5kQYfGI1WqQ3OyCiubdoMnjqp/abn8RAoB9I603XIKbtum481j6CREZonUAeKnjta+d3pZPaLB7n+@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4FllpQ8xASgpZZJ5s/RMh0OnXm3doBDQy4kkDXbpaCn9BGtee
	HPoLrlxlNKw5jqY8Ys3bCbRokgkiWvZGJd7NjTQJKwe9aH6cct4Ub5F1
X-Gm-Gg: AeBDiesSlsaA5//Ja142S7ImJeDIiI1jw+x3GQBlFMxiBvooPnp+9u7dLfgjJg6NY+F
	slyaI14eo0GOAzUu4NrGUqfXqJe+MECPxzYXQTgOR2TkqRYni81xdmLBKwekRSBH3+4RWlLLGCq
	AFY4eg7o+1xn8fZYoJ6Ru9bv5VdX9xOdM1SidWzaHgeVNAilxVnFVgBPXWdJ4ps/1GQWdM8yhoO
	7srxVBCjaVRt0NaKxkUrQzhftIhuAt2sBOmlnT/RRF/xwIMCb3dACBKhKgFZE3UxtsIEsZBDgAR
	R2r54fsTIZxT800n9t8MH3W0RSpijXO3Cm5j8nAiylRXQdiCIPXv/8Pz5P4w0gt7V+VjJ1seb5Y
	9QW3ThuB975IlKPIlBey8tn5ln5DBvkTG9IvyPTzwJHSRWpA1nbYh56T95FYlz1yx9hzJH04H7v
	wfS2v5HrrCQNVaRskfWEtGEBgnNydExdjhwfU=
X-Received: by 2002:a05:6402:4344:b0:66e:abc4:ffc5 with SMTP id 4fb4d7f45d1cf-670776521d8mr91248a12.2.1775765090059;
        Thu, 09 Apr 2026 13:04:50 -0700 (PDT)
Received: from [192.168.0.193] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67070816a8esm89789a12.25.2026.04.09.13.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 13:04:48 -0700 (PDT)
Message-ID: <da11f552-52dd-414b-ac73-6601a67dbd2b@gmail.com>
Date: Thu, 9 Apr 2026 22:04:47 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] leds: Introduce the multi_max_intensity sysfs
 attribute
To: Armin Wolf <W_Armin@gmx.de>, lee@kernel.org, pavel@kernel.org
Cc: linux-kernel@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 linux-leds@vger.kernel.org, linux-doc@vger.kernel.org,
 wse@tuxedocomputers.com, pobrn@protonmail.com, m.tretter@pengutronix.de
References: <20260331191619.3729-1-W_Armin@gmx.de>
 <20260331191619.3729-2-W_Armin@gmx.de>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20260331191619.3729-2-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7673-lists,linux-leds=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lwn.net,linuxfoundation.org,tuxedocomputers.com,protonmail.com,pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmx.de,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacekanaszewski@gmail.com,linux-leds@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,gmx.de:email]
X-Rspamd-Queue-Id: 244033CF32C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Armin,

On 3/31/26 9:16 PM, Armin Wolf wrote:
> Some multicolor LEDs support global brightness control in hardware,
> meaning that the maximum intensity of the color components is not
> connected to the maximum global brightness. Such LEDs cannot be
> described properly by the current multicolor LED class interface,
> because it assumes that the maximum intensity of each color component
> is described by the maximum global brightness of the LED.
> 
> Fix this by introducing a new sysfs attribute called
> "multi_max_intensity" holding the maximum intensity values for the
> color components of a multicolor LED class device. Drivers can use
> the new max_intensity field inside struct mc_subled to tell the
> multicolor LED class code about those values. Intensity values written
> by userspace applications will be limited to this maximum value.
> 
> Drivers for multicolor LEDs that do not support global brightness
> control in hardware might still want to use the maximum global LED
> brightness supplied via devicetree as the maximum intensity of each
> individual color component. Such drivers should set max_intensity
> to 0 so that the multicolor LED core can act accordingly.
> 
> The lp50xx and ncp5623 LED drivers already use hardware-based control
> for the global LED brightness. Modify those drivers to correctly
> initalize .max_intensity to avoid being limited to the maximum global
> brightness supplied via devicetree.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>   .../ABI/testing/sysfs-class-led-multicolor    | 19 ++++++--
>   Documentation/leds/leds-class-multicolor.rst  | 21 ++++++++-
>   drivers/leds/led-class-multicolor.c           | 47 ++++++++++++++++++-
>   drivers/leds/leds-lp50xx.c                    |  1 +
>   drivers/leds/rgb/leds-ncp5623.c               |  4 +-
>   include/linux/led-class-multicolor.h          | 30 +++++++++++-
>   6 files changed, 113 insertions(+), 9 deletions(-)

[...]

> diff --git a/include/linux/led-class-multicolor.h b/include/linux/led-class-multicolor.h
> index db9f34c6736e..6f89d92566b2 100644
> --- a/include/linux/led-class-multicolor.h
> +++ b/include/linux/led-class-multicolor.h
> @@ -9,10 +9,31 @@
>   #include <linux/leds.h>
>   #include <dt-bindings/leds/common.h>
>   
> +/**
> + * struct mc_subled - Color component description.
> + * @color_index: Color ID.
> + * @brightness: Scaled intensity.
> + * @intensity: Current intensity.
> + * @max_intensity: Maximum supported intensity value.
> + * @channel: Channel index.
> + *
> + * Describes a color component of a multicolor LED. Many multicolor LEDs
> + * do no support gobal brightness control in hardware, so they use

s/gobal/global/

> + * the brightness field in connection with led_mc_calc_color_components()
> + * to perform the intensity scaling in software.
> + * Such drivers should set max_intensity to 0 to signal the multicolor LED core
> + * that the maximum global brightness of the LED class device should be used for
> + * limiting incoming intensity values.
> + *
> + * Multicolor LEDs that do support global brightness control in hardware
> + * should instead set max_intensity to the maximum intensity value supported
> + * by the hardware for a given color component.
> + */
>   struct mc_subled {
>   	unsigned int color_index;
>   	unsigned int brightness;
>   	unsigned int intensity;
> +	unsigned int max_intensity;
>   	unsigned int channel;
>   };
>   
> @@ -53,7 +74,14 @@ int led_classdev_multicolor_register_ext(struct device *parent,
>    */
>   void led_classdev_multicolor_unregister(struct led_classdev_mc *mcled_cdev);
>   
> -/* Calculate brightness for the monochrome LED cluster */
> +/**
> + * led_mc_calc_color_components() - Calculates component brightness values of a LED cluster.
> + * @mcled_cdev - Multicolor LED class device of the LED cluster.
> + * @brightness - Global brightness of the LED cluster.
> + *
> + * Calculates the brightness values for each color component of a monochrome LED cluster,
> + * see Documentation/leds/leds-class-multicolor.rst for details.
> + */
>   int led_mc_calc_color_components(struct led_classdev_mc *mcled_cdev,
>   				 enum led_brightness brightness);
>   

Reviewed-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski


