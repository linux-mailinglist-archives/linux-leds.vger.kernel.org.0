Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 020B94172B
	for <lists+linux-leds@lfdr.de>; Tue, 11 Jun 2019 23:51:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405228AbfFKVvZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 11 Jun 2019 17:51:25 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:43338 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387764AbfFKVvZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 11 Jun 2019 17:51:25 -0400
Received: by mail-qt1-f193.google.com with SMTP id z24so3241821qtj.10;
        Tue, 11 Jun 2019 14:51:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7TWYrDDzfkQtKv9+OVgy+qU0N7iuCHIvNR6+Puv9gzk=;
        b=t+CCjQ/Pno8etKWdXdq1tHmV9jJCkiK3vjVL3NDXl+m6Ao0EojqQ5DX62gOGUvo7Si
         4KcCrSA1IFdsgnyMdbnoKccTIZZEPw0BEjViBiYsbuqDWRyoZH18IDfAmEd4XW8Yd8Tn
         lznWPMz0TeM6xb9eBzO8/j/brznEyaxJZAkzIlCE6bmcdPAM8Fde1XmAfqZiknFJ4Eea
         6A5L7zeKP3yRQb4lNPyC53A4AE51rTlf0k8PyWIRWOyBpOGBPX1XIINprQ1xYLxHnTTu
         97ljUN11XLZRJ4G7Ht3dg3TaQFK0bqIdcqBPICESTFdhm1fT4pKHLVqXYgTt+QWULmXX
         8q5Q==
X-Gm-Message-State: APjAAAVQVPmGd+giTO9948yVDdwRtq6+8BTkEzTSWD248V2KBMxXMp7Y
        N0yxc5WdMIsX88I/S6vQuQ==
X-Google-Smtp-Source: APXvYqw41EKa1vDT4YG9KxPTlR+OKZ8vNQM/geD9FeXtMv78BxIbs6gCj41LNOzCA2dBvc4h3ZRhEg==
X-Received: by 2002:ac8:2bbd:: with SMTP id m58mr67089312qtm.225.1560289884437;
        Tue, 11 Jun 2019 14:51:24 -0700 (PDT)
Received: from localhost ([64.188.179.199])
        by smtp.gmail.com with ESMTPSA id r5sm1914028qkc.42.2019.06.11.14.51.23
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 11 Jun 2019 14:51:23 -0700 (PDT)
Date:   Tue, 11 Jun 2019 15:51:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 7/9] dt: bindings: lp50xx: Introduce the lp50xx family
 of RGB drivers
Message-ID: <20190611215121.GA14337@bogus>
References: <20190523190820.29375-1-dmurphy@ti.com>
 <20190523190820.29375-8-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190523190820.29375-8-dmurphy@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, May 23, 2019 at 02:08:18PM -0500, Dan Murphy wrote:
> Introduce the bindings for the Texas Instruments LP5036, LP5030, LP5024 and
> LP5018 RGB LED device driver.  The LP5036/30/24/18 can control RGB LEDs
> individually or as part of a control bank group.  These devices have the ability
> to adjust the mixing control for the RGB LEDs to obtain different colors
> independent of the overall brightness of the LED grouping.
> 
> Datasheet:
> http://www.ti.com/lit/ds/symlink/lp5024.pdf
> http://www.ti.com/lit/ds/symlink/lp5036.pdf
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  .../devicetree/bindings/leds/leds-lp50xx.txt  | 142 ++++++++++++++++++
>  1 file changed, 142 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-lp50xx.txt

Reviewed-by: Rob Herring <robh@kernel.org>
