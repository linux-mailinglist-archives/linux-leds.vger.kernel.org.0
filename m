Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3D9427D3FB
	for <lists+linux-leds@lfdr.de>; Tue, 29 Sep 2020 18:56:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728416AbgI2Q4J (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 29 Sep 2020 12:56:09 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:43798 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727871AbgI2Q4J (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 29 Sep 2020 12:56:09 -0400
Received: by mail-ot1-f68.google.com with SMTP id n61so5105439ota.10;
        Tue, 29 Sep 2020 09:56:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=PTbvZ5SLBa13bxfuZucakWwWrfQxji5kPVT4ZxIxi/g=;
        b=s4ZUFpiEySES71yUG3ImS4u4722qdBqFiEqRCgoI/zYeNdz4cyK7KatVROGFDC0x7T
         FYwU2WyRLLBQkeSWVji2mv3PHbSfEhxOmjI5GA+FuvvzuFxJyKFU9T+xDJ9f7cx8/qbk
         o3egAIcjROUWxmNCe8ckG2mnrzSbzU4DPRF5OVoRgVoSdXpFCBYTBqy7773H5mcxC6zU
         b4tOPFyYcDOFDcO8JjsxfsSlkU1OQwZJ9hIP6xcfUIIdbDs8fGmx+kyiLMNJ5PjBsN33
         /2UkUcq1+y2ZsjYNXEA17hIiqO/T41s0fuipqbcmQIZqy9TSBNNgHtGnfISAxV+8NTx+
         eOSg==
X-Gm-Message-State: AOAM530NoyXe8nouoRt2lzuUoZeyo9TPRWeF0CL9SiWIBngDkTiK2p01
        jbOXvTRp04Z1DcN00k71+A==
X-Google-Smtp-Source: ABdhPJw0yu1bRXXxp3goH7ENwlh+CUaXanVxnYY4J94O908w2YB6HU5sfFKs+cCRxZ04XkDUTNdAzw==
X-Received: by 2002:a9d:67c3:: with SMTP id c3mr3646738otn.9.1601398568126;
        Tue, 29 Sep 2020 09:56:08 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u2sm1106097oig.48.2020.09.29.09.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 09:56:07 -0700 (PDT)
Received: (nullmailer pid 767605 invoked by uid 1000);
        Tue, 29 Sep 2020 16:56:06 -0000
Date:   Tue, 29 Sep 2020 11:56:06 -0500
From:   Rob Herring <robh@kernel.org>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Cc:     devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Tony Lindgren <tony@atomide.com>,
        Adam Ford <aford173@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        NeilBrown <neilb@suse.de>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH leds + devicetree 03/13] dt-bindings: leds: tca6507:
 convert to YAML
Message-ID: <20200929165606.GA767552@bogus>
References: <20200919221548.29984-1-marek.behun@nic.cz>
 <20200919221548.29984-4-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200919221548.29984-4-marek.behun@nic.cz>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, 20 Sep 2020 00:15:38 +0200, Marek Behún wrote:
> This converts the tca6507 LED binding to yaml.
> 
> Signed-off-by: Marek Behún <marek.behun@nic.cz>
> Cc: NeilBrown <neilb@suse.de>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: H. Nikolaus Schaller <hns@goldelico.com>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Adam Ford <aford173@gmail.com>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  .../devicetree/bindings/leds/tca6507.txt      |  49 -------
>  .../devicetree/bindings/leds/ti,tca6507.yaml  | 134 ++++++++++++++++++
>  2 files changed, 134 insertions(+), 49 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/leds/tca6507.txt
>  create mode 100644 Documentation/devicetree/bindings/leds/ti,tca6507.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
