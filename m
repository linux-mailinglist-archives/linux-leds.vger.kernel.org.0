Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F41EE127131
	for <lists+linux-leds@lfdr.de>; Fri, 20 Dec 2019 00:05:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbfLSXFQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 19 Dec 2019 18:05:16 -0500
Received: from mail-oi1-f171.google.com ([209.85.167.171]:44793 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726967AbfLSXFQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 19 Dec 2019 18:05:16 -0500
Received: by mail-oi1-f171.google.com with SMTP id d62so3836791oia.11;
        Thu, 19 Dec 2019 15:05:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=RdZ7cYZz02FUPDtdcTU6ePf8bGMqcPUm0XgeKy4Qx+M=;
        b=KSg9jGcVMYUUi8S9BuPrc4FQ6v352IajzTNRaMizEfYDWpcGaIUFwbgfSNa87pw1Dz
         HHidg2Ji9tt8MOYdVkWrQw6Z8hB+Btjd52FPUtLah8ia4XG0hSp+q6QMT/So4nIxz0Qx
         yitENNNgubO95WRQdZM6CsbTiHegGFeL2+VwA1bhefwnibCbMN8jGTzQA+/PET9sgAVd
         1puLVmFFHUHyYQBTwoLFl6apEOZY5JrOREeONuv6WcKmHVZTnCHeEDcUGQ+9YKwkrHk0
         KUi2sk5/g2K8+MOS4Dybf3p5IUrioPE3W1ARw7KSgJMCxMiwQ4rYK2Xwte934ftTbR7w
         jHVQ==
X-Gm-Message-State: APjAAAVqHHXONucvZhklq5GNszCAtD0IYB6GYsk5GDr+7IqU5eGNfK7D
        +AGpGbDidIiOYVD8fWqz3A==
X-Google-Smtp-Source: APXvYqx6IdTn7cJhRF9+Zo+VnWAZmVm+DgNbDAauA2Brn0vULoiXjJPrPJju+pouWFKV6ZPCUU/+zg==
X-Received: by 2002:a05:6808:484:: with SMTP id z4mr3297161oid.71.1576796715645;
        Thu, 19 Dec 2019 15:05:15 -0800 (PST)
Received: from localhost (ip-184-205-174-147.ftwttx.spcsdns.net. [184.205.174.147])
        by smtp.gmail.com with ESMTPSA id m89sm1326314otc.41.2019.12.19.15.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 15:05:14 -0800 (PST)
Date:   Thu, 19 Dec 2019 17:05:13 -0600
From:   Rob Herring <robh@kernel.org>
To:     Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc:     linux-realtek-soc@lists.infradead.org, linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        sales@fdhisi.com, Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org
Subject: Re: [RFC 11/25] dt-bindings: leds: tm1628: Add Fuda Hisi
 Microelectronics FD628
Message-ID: <20191219230513.GA5404@bogus>
References: <20191212033952.5967-1-afaerber@suse.de>
 <20191212033952.5967-12-afaerber@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191212033952.5967-12-afaerber@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 12 Dec 2019 04:39:38 +0100, =?UTF-8?q?Andreas=20F=C3=A4rber?= wrote:
> Add a compatible string for FD628.
> 
> Cc: sales@fdhisi.com
> Signed-off-by: Andreas Färber <afaerber@suse.de>
> ---
>  Documentation/devicetree/bindings/leds/titanmec,tm1628.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
